//
//  ComplexUnionSolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 31.05.2020.
//

import iGeometry

public extension PlainShape {

    func complexUnion(path: [IntPoint]) -> Solution {
        let hull = self.get(index: 0)
        
        let solution = Solver.union(master: hull, slave: path)

        switch solution.nature {
        case .slaveIncludeMaster, .equal, .notOverlap:
            return Solution(pathList: .empty, nature: solution.nature)
        case .masterIncludeSlave:
            return self.innerCase(unionPath: path)
        case .overlap:
            for i in 0..<solution.pathList.layouts.count {
                if solution.pathList.layouts[i].isClockWise {
                    var plainShape = PlainShape(points: solution.pathList.get(index: i))
                    for j in 0..<solution.pathList.layouts.count where j != i {
                        plainShape.add(hole: solution.pathList.get(index: j))
                    }
            
                    return self.overlapCase(plainShape: plainShape, unionPath: path)
                }
            }
            
            // imposible case
            return Solution(pathList: .empty, nature: .notOverlap)
        }

    }

    // если область находится внутри полигона
    private func innerCase(unionPath: [IntPoint]) -> Solution {
        let n = self.layouts.count
        guard n > 1 else {
            // у исходного полигона нету других дыр
            return Solution(pathList: .empty, nature: .masterIncludeSlave)
        }

        // новая дыра
        var subtractPath = unionPath
        subtractPath.invert()
        
        
        // дыры которые не пересекаются с новой дырой
        var notInteractedHoles = [Int]()
        var newShape = PlainShape(points: self.get(index: 0))
        var isInteract = false
        
        // вычитаем из всех дыр union path

        for i in 1..<n {
            var nextHole = self.get(index: i)
            nextHole.invert()

            let subtract = Solver.subtract(master: nextHole, slave: subtractPath)

            switch subtract.nature {
            case .notOverlap:
                notInteractedHoles.append(i)
            case .masterIncludeSlave, .equal:
                return Solution(pathList: .empty, nature: .notOverlap)
            case .slaveIncludeMaster:
                isInteract = true
            case .overlap:
                isInteract = true
                let shape = subtract.pathList
                for j in 0..<shape.layouts.count {
                    var hole = shape.get(index: j)
                    hole.invert()
                    newShape.add(path: hole, isClockWise: false)
                }
            }
        }
        
        if isInteract {
            for i in notInteractedHoles {
                let nextHole = self.get(index: i)
                newShape.add(hole: nextHole)
            }
            return Solution(pathList: newShape, nature: .overlap)
        } else {
            return Solution(pathList: .empty, nature: .masterIncludeSlave)
        }
    }

    private func overlapCase(plainShape: PlainShape, unionPath: [IntPoint]) -> Solution {
        let n = self.layouts.count
        guard n > 1 else {
            // у исходного полигона нету других дыр
            return Solution(pathList: plainShape, nature: .overlap)
        }
        
        var newShape = plainShape

        // новая дыра
        var subtractPath = unionPath
        subtractPath.invert()
        
        // дыры которые не пересекаются с новой дырой
        var notInteractedHoles = [Int]()
        
        // вычитаем из всех дыр union path

        for i in 1..<n {
            var nextHole = self.get(index: i)
            nextHole.invert()

            let subtract = Solver.subtract(master: nextHole, slave: subtractPath)

            switch subtract.nature {
            case .notOverlap:
                notInteractedHoles.append(i)
            case .masterIncludeSlave, .equal:
                // impossible case
                return Solution(pathList: plainShape, nature: .overlap)
            case .slaveIncludeMaster:
                continue
            case .overlap:
                let shape = subtract.pathList
                for j in 0..<shape.layouts.count {
                    var hole = shape.get(index: j)
                    hole.invert()
                    newShape.add(path: hole, isClockWise: false)
                }
            }
        }
        
        for i in notInteractedHoles {
            let nextHole = self.get(index: i)
            newShape.add(hole: nextHole)
        }
        
        return Solution(pathList: newShape, nature: .overlap)
        
    }

}
