//
//  Solver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 02.11.2019.
//

import iGeometry

public struct Solver {
    
    public static func cut(master: [IntPoint], slave: [IntPoint], iGeom: IntGeom) -> CutSolution {
        var navigator = Intersector.findPins(iMaster: master, iSlave: slave, iGeom: iGeom, exclusionPinType: PinPoint.PinType.in_out)
        
        guard !navigator.isEqual else {
            return CutSolution(restPathList: PlainPathList(), bitePathList: PlainPathList(), disposition: .empty)
        }
        
        let cursor = navigator.nextSubtract()
        
        guard cursor.isNotEmpty else {
            return CutSolution(restPathList: PlainPathList(), bitePathList: PlainPathList(), disposition: .empty)
        }
        
        let restPathList = Solver.subtract(cursor: cursor, navigator: navigator, master: master, slave: slave)
        let bitePathList = Solver.intersect(cursor: cursor, navigator: navigator, master: master, slave: slave)

        if restPathList.layouts.count > 0 {
            return CutSolution(restPathList: restPathList, bitePathList: bitePathList, disposition: .overlap)
        } else {
            return CutSolution(restPathList: restPathList, bitePathList: bitePathList, disposition: .notOverlap)
        }
    }
    
    public static func subtract(master: [IntPoint], slave: [IntPoint], iGeom: IntGeom) -> SubtractSolution {
        var navigator = Intersector.findPins(iMaster: master, iSlave: slave, iGeom: iGeom, exclusionPinType: PinPoint.PinType.in_out)
    
        guard !navigator.isEqual else {
            return SubtractSolution(pathList: PlainPathList(), disposition: .empty)
        }
    
        let cursor = navigator.nextSubtract()
    
        guard cursor.isNotEmpty else {
            return SubtractSolution(pathList: PlainPathList(), disposition: .notOverlap)
        }
        
        let pathList = Solver.subtract(cursor: cursor, navigator: navigator, master: master, slave: slave)
        
        if pathList.layouts.count > 0 {
            return SubtractSolution(pathList: pathList, disposition: .overlap)
        } else {
            return SubtractSolution(pathList: pathList, disposition: .notOverlap)
        }
    }
    
    public static func intersect(master: [IntPoint], slave: [IntPoint], iGeom: IntGeom) -> SubtractSolution {
        var navigator = Intersector.findPins(iMaster: master, iSlave: slave, iGeom: iGeom, exclusionPinType: PinPoint.PinType.in_out)
    
        guard !navigator.isEqual else {
            return SubtractSolution(pathList: PlainPathList(), disposition: .empty)
        }
    
        let cursor = navigator.nextSubtract()
    
        guard cursor.isNotEmpty else {
            return SubtractSolution(pathList: PlainPathList(), disposition: .notOverlap)
        }
        
        let pathList = Solver.intersect(cursor: cursor, navigator: navigator, master: master, slave: slave)
        
        if pathList.layouts.count > 0 {
            return SubtractSolution(pathList: pathList, disposition: .overlap)
        } else {
            return SubtractSolution(pathList: pathList, disposition: .notOverlap)
        }
    }

    public static func union(master: [IntPoint], slave: [IntPoint], iGeom: IntGeom) -> UnionSolution {
        var navigator = Intersector.findPins(iMaster: master, iSlave: slave, iGeom: iGeom, exclusionPinType: PinPoint.PinType.out_in)

        guard !navigator.isEqual else {
            var pathList = PlainPathList()
            pathList.append(path: master, isClockWise: true)
            return UnionSolution(pathList: pathList, nature: .overlap)
        }
        
        let cursor = navigator.nextUnion()

        guard cursor.isNotEmpty else {
            var pathList = PlainPathList()
            if navigator.hasContacts {
                if master.isOverlap(points: slave) {
                    pathList.append(path: master, isClockWise: true)
                    return UnionSolution(pathList: pathList, nature: .overlap)
                } else if slave.isOverlap(points: slave) {
                    pathList.append(path: slave, isClockWise: true)
                    return UnionSolution(pathList: pathList, nature: .overlap)
                } else {
                    return UnionSolution(pathList: pathList, nature: .notOverlap)
                }
            } else {
                if master.isContain(point: slave.any) {
                    pathList.append(path: master, isClockWise: true)
                    return UnionSolution(pathList: pathList, nature: .overlap)
                } else if slave.isContain(point: master.any) {
                    pathList.append(path: slave, isClockWise: true)
                    return UnionSolution(pathList: pathList, nature: .overlap)
                } else {
                    return UnionSolution(pathList: pathList, nature: .notOverlap)
                }
            }
        }
        
        let pathList = Solver.union(cursor: cursor, navigator: navigator, master: master, slave: slave)
        
        let solution: UnionSolution
        
        if pathList.layouts.count > 0 {
            return UnionSolution(pathList: pathList, nature: .overlap)
        } else {
            solution = UnionSolution(pathList: PlainPathList(), nature: .notOverlap)
        }

        return solution
        
    }
    
}

private extension Array where Element == IntPoint {
    
    var any: IntPoint {
        let a = self[0]
        let b = self[1]
        return IntPoint(x: (a.x + b.x) >> 1, y: (a.y + b.y) >> 1)
    }
    
    func isContain(point: IntPoint) -> Bool {
        let n = self.count
        var isContain = false
        var p2 = self[n - 1]
        for i in 0..<n {
            let p1 = self[i]
            if ((p1.y > point.y) != (p2.y > point.y)) && point.x < ((p2.x - p1.x) * (point.y - p1.y) / (p2.y - p1.y) + p1.x) {
                isContain = !isContain
            }
            p2 = p1
        }

        return isContain
    }
    
    func isOverlap(points: [IntPoint]) -> Bool {
        let n = points.count
        var a = points[n - 1]
        for i in 0..<n {
            let b = points[i]
            let c = IntPoint(x: (a.x + b.x) >> 1, y: (a.y + b.y) >> 1)
            if self.isContain(point: c) {
                return true
            }
            a = b
        }

        return false
    }
}
