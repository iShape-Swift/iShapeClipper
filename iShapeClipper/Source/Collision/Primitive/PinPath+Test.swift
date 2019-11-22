//
//  PinPath+Test.swift
//  iGeometry
//
//  Created by Nail Sharipov on 05/10/2019.
//
#if iShapeTest

import iGeometry

extension PinPath {
    
    func extract(points: [IntPoint]) -> [IntPoint] {
        let n = points.count
        
        let length = getTestLength(count: n)
        
        guard length > 1 else {
            return [v0.point, v1.point]
        }
        
        guard length != 2 else {
            let middle = points[(v0.masterMileStone.index + 1 ) % n]
            return [v0.point, middle, v1.point]
        }
        
        var path = [IntPoint]()
        path.reserveCapacity(length + 1)
        path.append(v0.point)
        
        
        var i = (v0.masterMileStone.index + 1) % n
        let endIndex: Int
        if v1.masterMileStone.offset != 0 {
            endIndex = v1.masterMileStone.index
        } else {
            endIndex = (v1.masterMileStone.index - 1 + n) % n
        }
        
        while i != endIndex {
            path.append(points[i])
            i = (i + 1) % n
        }
        path.append(points[endIndex])
        
        path.append(v1.point)
        
        return path
    }
    
}
#endif
