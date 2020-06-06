//
//  CutSolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 25.12.2019.
//

import iGeometry

public struct ComplexSubtractSolution {
    
    let isInteract: Bool
    let mainList: PlainShapeList
    let partList: PlainShapeList
    
}

public extension PlainShape {

    func complexSubtract(path: [IntPoint]) -> ComplexSubtractSolution {
        let hull = self.get(index: 0)
        
        let solution = Solver.cut(master: hull, slave: path)

        switch solution.nature {
 
        case .notOverlap:
            return ComplexSubtractSolution(isInteract: false, mainList: .empty, partList: .empty)
        case .slaveIncludeMaster, .equal:
            return ComplexSubtractSolution(isInteract: true, mainList: .empty, partList: PlainShapeList(plainShape: self))
        case .masterIncludeSlave:
            return self.holeCase(cutPath: path)
        case .overlap:
            return self.overlapCase(solution: solution)
        }
    }

    // если дыра находится внутри полигона
    private func holeCase(cutPath: [IntPoint]) -> ComplexSubtractSolution {
        let n = self.layouts.count
        guard n > 1 else {
            // у исходного полигона нету других дыр
            var main = self
            main.add(path: cutPath, isClockWise: false)
            let biteList = PlainShapeList(plainShape: PlainShape(points: cutPath.reversed()))
            return ComplexSubtractSolution(isInteract: true, mainList: PlainShapeList(plainShape: main), partList: biteList)
        }
        var mainList: PlainShapeList = .empty
        if self.holeCaseMainList(cutPath: cutPath, plainShapeList: &mainList) {
            let biteList = self.holeCaseBiteList(cutPath: cutPath)
            return ComplexSubtractSolution(isInteract: true, mainList: mainList, partList: biteList)
        } else {
            return ComplexSubtractSolution(isInteract: false, mainList: mainList, partList: .empty)
        }
    }
    
    private func overlapCase(solution: DualSolution) -> ComplexSubtractSolution {
        let shapePaths = self.overlapCaseMainList(restPathList: solution.mainPathList)
        let bitList = self.overlapCaseBiteList(bitePathList: solution.partPathList)
        
        return ComplexSubtractSolution(isInteract: true, mainList: shapePaths, partList: bitList)
    }
    
    private func overlapCaseMainList(restPathList: PlainShape) -> PlainShapeList {
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
                let subtract = Solver.subtract(master: island, slave: hole)
                switch subtract.nature {
                case .slaveIncludeMaster, .equal:
                    // остров совпал с дыркой
                    shapePaths.remove(index: i)
                    continue nextIsland
                case .notOverlap:
                    continue
                case .overlap:
                    var islandsCount: Int = 0
                    for layout in subtract.pathList.layouts where layout.isClockWise {
                        islandsCount += 1
                    }
                    if islandsCount == 1 {
                        island = subtract.pathList.get(index: 0)
                    } else {
                        shapePaths.remove(index: i)
                        for layout in subtract.pathList.layouts where layout.isClockWise {
                            let newIsland = subtract.pathList.get(layout: layout)
                            shapePaths.add(path: newIsland, isClockWise: true)
                        }
                        continue nextIsland
                    }
                case .masterIncludeSlave:
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
    
    private func overlapCaseBiteList(bitePathList: PlainShape) -> PlainShapeList {
        var subPaths = PlainShape(pointsCapacity: bitePathList.points.count, layoutsCapacity: bitePathList.layouts.count)
        for i in 0..<bitePathList.layouts.count {
            let subPath: [IntPoint] = bitePathList.get(index: i).reversed()
            subPaths.add(path: subPath, isClockWise: true)
        }
        return self.biteList(subPaths: &subPaths)
    }
    
    
    private func holeCaseMainList(cutPath: [IntPoint], plainShapeList: inout PlainShapeList) -> Bool {
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
            
            let union = Solver.union(master: rootHole, slave: nextHole)
            
            switch union.nature {
            case .notOverlap:
                notInteractedHoles.append(i)
            case .masterIncludeSlave, .equal:
                interactedHoles.append(i)
            case .slaveIncludeMaster:
                plainShapeList = .empty
                return false
            case .overlap:
                interactedHoles.append(i)
                let uShape = union.pathList
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
            plainShapeList = PlainShapeList(plainShape: mainShape)
            return true
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
                
                let subtract = Solver.subtract(master: island, slave: hole)
                switch subtract.nature {
                case .slaveIncludeMaster, .equal:
                    // остров совпал с дыркой
                    i += 1
                    continue nextIsland
                case .notOverlap:
                    // нет пересечений
                    break
                case .overlap:
                    island = subtract.pathList.get(index: 0)
                    if subtract.pathList.layouts.count > 1 {
                        for s in 1..<subtract.pathList.layouts.count {
                            let part = subtract.pathList.get(index: s)
                            islands.add(path: part, isClockWise: true)
                        }
                    }
                case .masterIncludeSlave:
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
        
        plainShapeList = shapeParts
        
        return true
    }
    
    private func holeCaseBiteList(cutPath: [IntPoint]) -> PlainShapeList {
        var subPaths = PlainShape(points: cutPath.reversed())
        return self.biteList(subPaths: &subPaths)
    }
    
    private func biteList(subPaths: inout PlainShape) -> PlainShapeList {
        // откусим от новой дыры все имеющиеся дыры полигона
    
        let n = self.layouts.count
        
        var holes = PlainShape.empty

        for i in 1..<n {
            let nextHole = self.get(index: i)
            
            var j = 0
            while j < subPaths.layouts.count {
                let bitPath = subPaths.get(index: j)
                let subtract = Solver.subtract(master: bitPath, slave: nextHole)
                switch subtract.nature {
                case .notOverlap:
                    j += 1
                case .overlap:
                    var newSubPathCount = 0
                    for k in 0..<subtract.pathList.layouts.count {
                        if subtract.pathList.layouts[k].isClockWise {
                            let subPath = subtract.pathList.get(index: k)
                            if newSubPathCount == 0 {
                                subPaths.replace(index: j, path: subPath)
                            } else {
                                subPaths.add(path: subPath, isClockWise: true)
                            }
                            newSubPathCount += 1
                        } else {
                            let holePath = subtract.pathList.get(index: k)
                            holes.add(path: holePath, isClockWise: false)
                        }
                    }
                    if newSubPathCount > 1 {
                        j += newSubPathCount
                    } else {
                        j += 1
                    }
                case .slaveIncludeMaster, .equal:
                    subPaths.remove(index: j)
                case .masterIncludeSlave:
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
