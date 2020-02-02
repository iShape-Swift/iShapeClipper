//
//  CutSolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 25.12.2019.
//

import iGeometry

public struct SolutionResult {
    
    let isInteract: Bool
    let mainList: PlainShapeList
    let bitList: PlainShapeList
    
}

public extension PlainShape {

    func cut(path: [IntPoint], iGeom: IntGeom) -> SolutionResult {
        let hull = self.get(index: 0)
        
        let cutHullSolution = Solver.cut(master: hull, slave: path, iGeom: iGeom)

        switch cutHullSolution.nature {
 
        case .notOverlap:
            return SolutionResult(isInteract: false, mainList: .empty, bitList: .empty)
        case .empty:
            return SolutionResult(isInteract: true, mainList: .empty, bitList: PlainShapeList(plainShape: self))
        case .hole:
            return self.holeCase(cutPath: path, iGeom: iGeom)
        case .overlap:
            return self.overlapCase(cutHullSolution: cutHullSolution, iGeom: iGeom)
        }
    }
    
    private struct Pair {
        let index: Int
        let shpaeIndex: Int
    }
    
    // если дыра находится внутри полигона
    private func holeCase(cutPath: [IntPoint], iGeom: IntGeom) -> SolutionResult {
        let n = self.layouts.count
        guard n > 1 else {
            // у исходного полигона нету других дыр
            var mainShape = self
            mainShape.add(hole: cutPath)
            let bitList = PlainShapeList(plainShape: PlainShape(points: cutPath))
            return SolutionResult(isInteract: true, mainList: PlainShapeList(plainShape: mainShape), bitList: bitList)
        }
        
        let shapePaths = self.holeCaseShapeList(cutPath: cutPath, iGeom: iGeom)
        let bitPaths = self.holeCaseBitList(cutPath: cutPath, iGeom: iGeom)
        
        return SolutionResult(isInteract: true, mainList: shapePaths, bitList: bitPaths)
    }
    
    private func overlapCase(cutHullSolution: CutSolution, iGeom: IntGeom) -> SolutionResult {
        let shapePaths = self.overlapCaseShapeList(restPathList: cutHullSolution.restPathList, iGeom: iGeom)
        let bitList = self.overlapCaseBitList(bitePathList: cutHullSolution.bitePathList, iGeom: iGeom)
        
        return SolutionResult(isInteract: true, mainList: shapePaths, bitList: bitList)
    }
    
    private func overlapCaseShapeList(restPathList: PlainShape, iGeom: IntGeom) -> PlainShapeList {
        let n = self.layouts.count
        guard n > 1 else {
            return PlainShapeList(plainShape: restPathList)
        }

        var shapePaths = restPathList
        var result = PlainShapeList(minimumPointsCapacity: shapePaths.points.count, minimumLayoutsCapacity: 2 * shapePaths.layouts.count, minimumSegmentsCapacity: shapePaths.layouts.count)
        
        var holes = Array<Int>(repeating: 0, count: n - 1)
        for i in 1..<n {
            holes[i - 1] = i
        }
    
        var i = 0
        nextIsland:
        while i < shapePaths.layouts.count {
            var island = shapePaths.get(index: i)
            var usedHoles = [Int]()
            for j in 0..<holes.count {
                let holeIndex = holes[j]
                let hole = self.get(index: holeIndex)
                let diff = Solver.subtract(master: island, slave: hole, iGeom: iGeom)
                switch diff.nature {
                case .empty:
                    // остров совпал с дыркой
                    shapePaths.remove(index: i)
                    continue nextIsland
                case .notOverlap:
                    continue
                case .overlap:
                    var islandsCount: Int = 0
                    for layout in diff.pathList.layouts where layout.isClockWise {
                        islandsCount += 1
                    }
                    if islandsCount == 1 {
                        island = diff.pathList.get(index: 0)
                    } else {
                        shapePaths.remove(index: i)
                        for layout in diff.pathList.layouts where layout.isClockWise {
                            let newIsland = diff.pathList.get(layout: layout)
                            shapePaths.add(path: newIsland, isClockWise: true)
                        }
                        continue nextIsland
                    }
                case .hole:
                    usedHoles.append(j)
                }
            }
            
            var islandShape = PlainShape(points: island)
            
            if !usedHoles.isEmpty {
                for j in usedHoles {
                    let holeIndex = holes[j]
                    let hole = self.get(index: holeIndex)
                    islandShape.add(hole: hole)
                }
                
                var j = usedHoles.count - 1
                while j > 0 {
                    holes.remove(at: usedHoles[j])
                    j -= 1
                }
            }
            
            result.add(plainShape: islandShape)

            i += 1
        }
            
        return result
    }
    
    private func overlapCaseBitList(bitePathList: PlainShape, iGeom: IntGeom) -> PlainShapeList {
        var subPaths = PlainShape(pointsCapacity: bitePathList.points.count, layoutsCapacity: bitePathList.layouts.count)
        for i in 0..<bitePathList.layouts.count {
            let subPath: [IntPoint] = bitePathList.get(index: i).reversed()
            subPaths.add(path: subPath, isClockWise: true)
        }
        return self.bitList(subPaths: &subPaths, iGeom: iGeom)
    }
    
    
    private func holeCaseShapeList(cutPath: [IntPoint], iGeom: IntGeom) -> PlainShapeList {
        let n = self.layouts.count
        
        // новая дыра
        var superHole = cutPath
        superHole.invert()
        
        // дыры которые не пересекаются с новой дырой
        var notInteractedHoles = [Int]()
        var insideHoles = [Int]()

        // островки полигона которые оказались внутри новой дыры
        var islands = PlainShape.empty
        
        // попытаемся объединить другие дыры с новой
        for i in 1..<n {
            var nextHole = self.get(index: i)
            nextHole.invert()
            
            let unionSolution = Solver.union(master: superHole, slave: nextHole, iGeom: iGeom)
            
            switch unionSolution.nature {
            case .notOverlap:
                notInteractedHoles.append(i)
            case .masterIncludeSlave:
                insideHoles.append(i)
            case .overlap, .slaveIncludeMaster:
                let uShape = unionSolution.pathList
                for j in 0..<uShape.layouts.count {
                    if uShape.layouts[j].isClockWise {
                        superHole = uShape.get(index: j)
                    } else {
                        var island = uShape.get(index: j)
                        island.invert()
                        islands.add(path: island, isClockWise: true)
                    }
                }
                
            }
        }
        
        guard !islands.layouts.isEmpty else {
            var mainShape = PlainShape(points: self.get(index: 0))
            mainShape.add(hole: superHole)
            for j in 0..<notInteractedHoles.count {
                let index = notInteractedHoles[j]
                let hole = self.get(index: index)
                mainShape.add(hole: hole)
            }
            return PlainShapeList(plainShape: mainShape)
        }
        
        notInteractedHoles.append(contentsOf: insideHoles)

        // вычитаем из внутрениних островков дыры, которые не пересеклись
        
        var shapeParts = PlainShapeList(minimumPointsCapacity: islands.points.count, minimumLayoutsCapacity: 2 * islands.layouts.count, minimumSegmentsCapacity: islands.layouts.count)

        // ведем учет дыр которые не участвуют в образовнии островов
        var usedHoles = Array<Bool>(repeating: false, count: notInteractedHoles.count)
        var usedHolesCount: Int = 0
        
        var j = 0
        nextIsland:
        repeat {
            // должны быть перечисленны по часовой стрелке
            var island = islands.get(index: j)
            var islandHoles = PlainShape.empty
            for k in 0..<notInteractedHoles.count {
                let index = notInteractedHoles[k]
                let hole = self.get(index: index)
                
                let diffSolution = Solver.subtract(master: island, slave: hole, iGeom: iGeom)
                switch diffSolution.nature {
                case .empty:
                    // остров совпал с дыркой
                    j += 1
                    usedHoles[k] = true
                    usedHolesCount += 1
                    continue nextIsland
                case .notOverlap:
                    // нет пересечений
                    break
                case .overlap:
                    usedHoles[k] = true
                    usedHolesCount += 1
                    
                    island = diffSolution.pathList.get(index: 0)
                    if diffSolution.pathList.layouts.count > 1 {
                        for s in 1..<diffSolution.pathList.layouts.count {
                            let part = diffSolution.pathList.get(index: s)
                            islands.add(path: part, isClockWise: true)
                        }
                    }
                case .hole:
                    usedHoles[k] = true
                    usedHolesCount += 1
                    islandHoles.add(hole: hole)
                }
            }
            var islandShape = PlainShape(points: island)
            if islandHoles.layouts.count > 0 {
                for s in 0..<islandHoles.layouts.count {
                    let hole = islandHoles.get(index: s)
                    islandShape.add(path: hole, isClockWise: false)
                }
            }
            
            shapeParts.add(plainShape: islandShape)

            j += 1
        } while j < islands.layouts.count
        
        
        var mainShape = PlainShape(points: self.get(index: 0))
        superHole.invert()
        mainShape.add(hole: superHole)

        if usedHolesCount != usedHoles.count {
            let excludeInsideHolesIndices = notInteractedHoles.count - insideHoles.count
            for k in 0..<usedHoles.count where k < excludeInsideHolesIndices && !usedHoles[k] {
                let index = notInteractedHoles[k]
                let hole = self.get(index: index)
                mainShape.add(hole: hole)
            }
        }
        shapeParts.add(plainShape: mainShape)
        
        return shapeParts
    }
    
    private func holeCaseBitList(cutPath: [IntPoint], iGeom: IntGeom) -> PlainShapeList {
        var subPaths = PlainShape(points: cutPath.reversed())
        return self.bitList(subPaths: &subPaths, iGeom: iGeom)
    }
    
    private func bitList(subPaths: inout PlainShape, iGeom: IntGeom) -> PlainShapeList {
        // откусим от новой дыры все имеющиеся дыры полигона
    
        let n = self.layouts.count
        
        var holes = PlainShape.empty

        for i in 1..<n {
            let nextHole = self.get(index: i)
            
            var j = 0
            while j < subPaths.layouts.count {
                let bitPath = subPaths.get(index: j)
                let solution = Solver.subtract(master: bitPath, slave: nextHole, iGeom: iGeom)
                switch solution.nature {
                case .notOverlap:
                    j += 1
                case .overlap:
                    var newSubPathCount = 0
                    for k in 0..<solution.pathList.layouts.count {
                        if solution.pathList.layouts[k].isClockWise {
                            let subPath = solution.pathList.get(index: k)
                            if newSubPathCount == 0 {
                                subPaths.replace(index: j, path: subPath)
                            } else {
                                subPaths.add(path: subPath, isClockWise: true)
                            }
                            newSubPathCount += 1
                        } else {
                            let holePath = solution.pathList.get(index: k)
                            holes.add(path: holePath, isClockWise: false)
                        }
                    }
                    if newSubPathCount > 1 {
                        j += newSubPathCount
                    } else {
                        j += 1
                    }
                case .empty:
                    subPaths.remove(index: j)
                case .hole:
                    holes.add(path: nextHole, isClockWise: false)
                    j += 1
                }
            }
        }
        
        guard subPaths.layouts.count > 0 else {
            return PlainShapeList.empty
        }
        
        guard holes.layouts.count > 0 else {
            return PlainShapeList(plainShape: subPaths)
        }

        var bitPaths = PlainShapeList.empty
        
        for i in 0..<subPaths.layouts.count {
            let subPath = subPaths.get(index: i)
            var subShape = PlainShape(points: subPath)
            for j in 0..<holes.layouts.count {
                let hole = holes.get(index: j)
                if subPath.isContain(hole: hole, isClockWise: false) {
                    subShape.add(hole: hole)
                }
            }
            bitPaths.add(plainShape: subShape)
        }
        
        return bitPaths
    }
    
}
