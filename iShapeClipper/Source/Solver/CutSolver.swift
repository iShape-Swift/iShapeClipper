//
//  CutSolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 25.12.2019.
//

import iGeometry

public struct BiteSolution {
    
    let isInteract: Bool
    let mainList: PlainShapeList
    let biteList: PlainShapeList
    
}

public extension PlainShape {

    func bite(path: [IntPoint], iGeom: IntGeom) -> BiteSolution {
        let hull = self.get(index: 0)
        
        let cutHullSolution = Solver.cut(master: hull, slave: path, iGeom: iGeom)

        switch cutHullSolution.nature {
 
        case .notOverlap:
            return BiteSolution(isInteract: false, mainList: .empty, biteList: .empty)
        case .empty:
            return BiteSolution(isInteract: true, mainList: .empty, biteList: PlainShapeList(plainShape: self))
        case .hole:
            return self.holeCase(cutPath: path, iGeom: iGeom)
        case .overlap:
            return self.overlapCase(cutHullSolution: cutHullSolution, iGeom: iGeom)
        }
    }

    // если дыра находится внутри полигона
    private func holeCase(cutPath: [IntPoint], iGeom: IntGeom) -> BiteSolution {
        let n = self.layouts.count
        guard n > 1 else {
            // у исходного полигона нету других дыр
            var main = self
            main.add(path: cutPath, isClockWise: false)
            let biteList = PlainShapeList(plainShape: PlainShape(points: cutPath.reversed()))
            return BiteSolution(isInteract: true, mainList: PlainShapeList(plainShape: main), biteList: biteList)
        }
        
        let mainList = self.holeCaseMainList(cutPath: cutPath, iGeom: iGeom)
        let biteList = self.holeCaseBiteList(cutPath: cutPath, iGeom: iGeom)
        
        return BiteSolution(isInteract: true, mainList: mainList, biteList: biteList)
    }
    
    private func overlapCase(cutHullSolution: CutSolution, iGeom: IntGeom) -> BiteSolution {
        let shapePaths = self.overlapCaseMainList(restPathList: cutHullSolution.restPathList, iGeom: iGeom)
        let bitList = self.overlapCaseBiteList(bitePathList: cutHullSolution.bitePathList, iGeom: iGeom)
        
        return BiteSolution(isInteract: true, mainList: shapePaths, biteList: bitList)
    }
    
    private func overlapCaseMainList(restPathList: PlainShape, iGeom: IntGeom) -> PlainShapeList {
        let n = self.layouts.count
        guard n > 1 else {
            let count = restPathList.layouts.count
            let points = restPathList.points
            var layouts = [PlainShape.Layout](repeating: .init(begin: 0, length: 0, isClockWise: true), count: count)
            var segments = [PlainShapeList.Segment](repeating: .init(begin: 0, length: 1), count: count)
            for j in 0..<count {
                let length = restPathList.layouts[j].length
                layouts[j] = PlainShape.Layout(begin: 0, length: length, isClockWise: true)
                segments[j] = PlainShapeList.Segment(begin: j, length: 1)
            }

            return PlainShapeList(points: points, layouts: layouts, segments: segments)
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
                    islandShape.add(path: hole, isClockWise: false)
                }
            }
            
            result.add(plainShape: islandShape)

            i += 1
        }
            
        return result
    }
    
    private func overlapCaseBiteList(bitePathList: PlainShape, iGeom: IntGeom) -> PlainShapeList {
        var subPaths = PlainShape(pointsCapacity: bitePathList.points.count, layoutsCapacity: bitePathList.layouts.count)
        for i in 0..<bitePathList.layouts.count {
            let subPath: [IntPoint] = bitePathList.get(index: i).reversed()
            subPaths.add(path: subPath, isClockWise: true)
        }
        return self.biteList(subPaths: &subPaths, iGeom: iGeom)
    }
    
    
    private func holeCaseMainList(cutPath: [IntPoint], iGeom: IntGeom) -> PlainShapeList {
        let n = self.layouts.count
        
        // новая дыра
        var rootHole = cutPath
        rootHole.invert()
        
        // дыры которые не пересекаются с новой дырой
        var notInteractedHoles = [Int]()
        var interactedHoles = [Int]()

        // островки полигона которые оказались внутри новой дыры
        var islands = PlainShape.empty
        
        // попытаемся объединить другие дыры с новой
        for i in 1..<n {
            var nextHole = self.get(index: i)
            nextHole.invert()
            
            let unionSolution = Solver.union(master: rootHole, slave: nextHole, iGeom: iGeom)
            
            switch unionSolution.nature {
            case .notOverlap:
                notInteractedHoles.append(i)
            case .masterIncludeSlave:
                interactedHoles.append(i)
            case .overlap, .slaveIncludeMaster:
                interactedHoles.append(i)
                let uShape = unionSolution.pathList
                for j in 0..<uShape.layouts.count {
                    if uShape.layouts[j].isClockWise {
                        rootHole = uShape.get(index: j)
                    } else {
                        var island = uShape.get(index: j)
                        island.invert()
                        islands.add(path: island, isClockWise: true)
                    }
                }
            }
        }
        
        if !notInteractedHoles.isEmpty {
            // часть из этих дыр в итоге могло оказаться внутри rooh hole
            var i = notInteractedHoles.count - 1
            while i >= 0 {
                let index = notInteractedHoles[i]
                let nextHole = self.get(index: index)
                if rootHole.isContain(hole: nextHole, isClockWise: false) {
                    notInteractedHoles.remove(at: i)
                    interactedHoles.append(index)
                }
                i -= 1
            }
        }

        guard !islands.layouts.isEmpty else {
            var mainShape = PlainShape(points: self.get(index: 0))
            mainShape.add(path: rootHole.reversed(), isClockWise: false)
            for i in 0..<notInteractedHoles.count {
                let index = notInteractedHoles[i]
                let hole = self.get(index: index)
                mainShape.add(path: hole, isClockWise: false)
            }
            return PlainShapeList(plainShape: mainShape)
        }

        // вычитаем из внутрениних островков дыры, которые внутри или соприкосались с главной дырой
        
        var shapeParts = PlainShapeList(minimumPointsCapacity: islands.points.count, minimumLayoutsCapacity: 2 * islands.layouts.count, minimumSegmentsCapacity: islands.layouts.count)

        var i = 0
        nextIsland:
        repeat {
            // должны быть перечисленны по часовой стрелке
            var island = islands.get(index: i)
            var islandHoles = [Int]()
            for j in 0..<interactedHoles.count {
                let index = interactedHoles[j]
                let hole = self.get(index: index)
                
                let diffSolution = Solver.subtract(master: island, slave: hole, iGeom: iGeom)
                switch diffSolution.nature {
                case .empty:
                    // остров совпал с дыркой
                    i += 1
                    continue nextIsland
                case .notOverlap:
                    // нет пересечений
                    break
                case .overlap:
                    island = diffSolution.pathList.get(index: 0)
                    if diffSolution.pathList.layouts.count > 1 {
                        for s in 1..<diffSolution.pathList.layouts.count {
                            let part = diffSolution.pathList.get(index: s)
                            islands.add(path: part, isClockWise: true)
                        }
                    }
                case .hole:
                    islandHoles.append(index)
                }
            }
            var islandShape = PlainShape(points: island)
            if !islandHoles.isEmpty {
                for k in 0..<islandHoles.count {
                    let index = islandHoles[k]
                    let hole = self.get(index: index)
                    islandShape.add(path: hole, isClockWise: false)
                }
            }
            
            shapeParts.add(plainShape: islandShape)

            i += 1
        } while i < islands.layouts.count

        var rootShape = PlainShape(points: self.get(index: 0))
        rootHole.invert()
        rootShape.add(path: rootHole, isClockWise: false)

        if !notInteractedHoles.isEmpty {
            for i in 0..<notInteractedHoles.count {
                let index = notInteractedHoles[i]
                let hole = self.get(index: index)
                rootShape.add(path: hole, isClockWise: false)
            }
        }
        shapeParts.add(plainShape: rootShape)
        
        return shapeParts
    }
    
    private func holeCaseBiteList(cutPath: [IntPoint], iGeom: IntGeom) -> PlainShapeList {
        var subPaths = PlainShape(points: cutPath.reversed())
        return self.biteList(subPaths: &subPaths, iGeom: iGeom)
    }
    
    private func biteList(subPaths: inout PlainShape, iGeom: IntGeom) -> PlainShapeList {
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
        
        var biteList = PlainShapeList.empty
        
        guard subPaths.layouts.count > 0 else {
            return biteList
        }

        guard holes.layouts.count > 0 else {
            for i in 0..<subPaths.layouts.count {
                let subPath = subPaths.get(index: i)
                let subShape = PlainShape(points: subPath)
                biteList.add(plainShape: subShape)
            }

            return biteList
        }
        
        for i in 0..<subPaths.layouts.count {
            let subPath = subPaths.get(index: i)
            var subShape = PlainShape(points: subPath)
            for j in 0..<holes.layouts.count {
                let hole = holes.get(index: j)
                if subPath.isContain(hole: hole, isClockWise: false) {
                    subShape.add(path: hole, isClockWise: false)
                }
            }
            biteList.add(plainShape: subShape)
        }
        
        return biteList
    }
    
}
