//
//  MultiUnionSolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 09.06.2020.
//

import iGeometry

public extension Array where Element == PlainShape {
    
    mutating func union(path: [IntPoint]) {
        var holes = PlainShape.empty
        var hull = [IntPoint]()

        var i = self.count - 1
        while i >= 0 {
            let shape = self[i]
            let solution = shape.complexUnion(path: path)
            switch solution.nature {
            case .masterIncludeSlave:
                self[i] = PlainShape(points: shape.get(index: 0))
                return
            case .slaveIncludeMaster, .equal:
                self.remove(at: i)
            case .overlap:
                if !solution.pathList.layouts.isEmpty {
                    for j in 1..<solution.pathList.layouts.count {
                        holes.add(hole: solution.pathList.get(index: j))
                    }
                }
                if hull.isEmpty {
                    hull = solution.pathList.get(index: 0)
                } else {
                    let shapeHull = shape.get(index: 0)
                    let unionSolution = Solver.union(master: shapeHull, slave: hull)
                    hull = unionSolution.pathList.get(index: 0)
                }
                self.remove(at: i)
            case .notOverlap:
                break
            }
            i -= 1
        }
        if !hull.isEmpty {
            var unionShape = PlainShape(points: hull)
            // TODO optimise
            if !holes.layouts.isEmpty {
                for j in 0..<holes.layouts.count {
                    unionShape.add(hole: holes.get(index: j))
                }
            }
            
            self.append(unionShape)
        } else {
            self.append(PlainShape(points: path))
        }

    }
    
}
