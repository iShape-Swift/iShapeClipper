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
        let hullLayout = self.layouts[0]
        let hullPoints = Array(self.points[hullLayout.begin...hullLayout.end])
        
        let cutHullSolution = Solver.cut(master: hullPoints, slave: path, iGeom: iGeom)

        switch cutHullSolution.nature {
 
        case .notOverlap:
            return SolutionResult(isInteract: false, mainList: .empty, bitList: .empty)
        case .empty:
            return SolutionResult(isInteract: true, mainList: .empty, bitList: .empty)
        case .hole:
            return self.holeCase(cutPath: path, iGeom: iGeom)
        case .overlap:
//            return PlainShape.overlapCase(cutHullSolution: cutHullSolution, path: path, iGeom: iGeom)
            return SolutionResult(isInteract: true, mainList: .empty, bitList: .empty)
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

        // новая дыра
        var superHole = cutPath
        superHole.invert()
        
        // дыры которые не пересекаются с новой дырой
        var notInteractedHoles = [Int]()

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
            case .overlap:
                let uShape = unionSolution.pathList
                for j in 0..<uShape.layouts.count {
                    if uShape.layouts[j].isClockWise {
                        superHole = uShape.get(index: j)
                    } else {
                        var island = uShape.get(index: j)
                        island.invert()
                        islands.add(path: island, isClockWise: false)
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
            // тут ошибка bitList не учитывает пересечения с дырами
            let bitList = PlainShapeList(plainShape: PlainShape(points: cutPath))
            return SolutionResult(isInteract: true, mainList: PlainShapeList(plainShape: mainShape), bitList: bitList)
        }
        

        
        guard !notInteractedHoles.isEmpty else {
            var mainShape = PlainShape(points: self.get(index: 0))
            mainShape.add(hole: superHole)
            
            let bitList = PlainShapeList(plainShape: PlainShape(points: cutPath))
            return SolutionResult(isInteract: true, mainList: PlainShapeList(plainShape: mainShape), bitList: bitList)
        }
        
        // вычитаем из внутрениних островков дыры, которые не пересеклись
        
        var result = PlainShapeList(minimumPointsCapacity: islands.points.count, minimumLayoutsCapacity: 2 * islands.layouts.count,
         minimumSegmentsCapacity: islands.layouts.count)

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
                    if diffSolution.pathList.layouts.count == 1 {
                        island = diffSolution.pathList.get(index: 0)
                    } else {
                        // остров разбился на несколько частей
                        islands.remove(index: j)
                        for s in 0..<diffSolution.pathList.layouts.count {
                            let part = diffSolution.pathList.get(index: s)
                            islands.add(path: part, isClockWise: true)
                        }
                        continue nextIsland
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
            
            result.add(plainShape: islandShape)

            j += 1
        } while j < islands.layouts.count
        
        
        var mainShape = PlainShape(points: self.get(index: 0))
        superHole.invert()
        mainShape.add(hole: superHole)
        if usedHolesCount != usedHoles.count {
            for k in 0..<usedHoles.count where !usedHoles[k] {
                let index = notInteractedHoles[k]
                let hole = self.get(index: index)
                mainShape.add(hole: hole)
            }
        }
        result.add(plainShape: mainShape)
        
        
        //  пока не правильный
        let bitList = PlainShapeList(plainShape: PlainShape(points: cutPath))
        
        return SolutionResult(isInteract: true, mainList: result, bitList: bitList)
    }
    /*
    private static func overlapCase(cutHullSolution: CutSolution, path: [IntPoint], iGeom: IntGeom) -> SolutionResult {
        var plainShapeList = PlainShapeList(points: [], layouts: [], segments: [])
        
        
        
    }
    
    */
}
