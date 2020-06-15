//
//  CircleDefinition.swift
//  iGeometry
//
//  Created by Nail Sharipov on 11.06.2020.
//

import Foundation
import iGeometry

public struct CircleDefinition {
    
    static private let unityPoints: [Point] = {
        let count = 128
        var points = Array<Point>(repeating: .zero, count: count)
        let da = 2 * Float.pi / Float(count)
        var a: Float = 0
        for i in 0..<count {
            points[i] = Point(x: cos(a), y: sin(a))
            a -= da
        }
        return points
    }()
    
    let radius: Float
    var center: Point
    let minX: Float
    
    public init(center: Point, radius: Float) {
        self.center = center
        self.radius = radius
        self.minX = center.x - radius
    }
    
    func getPath(maxRadius: Float, iGeom: IntGeom) -> [IntPoint] {
        let uCount = CircleDefinition.unityPoints.count
        var count = Int(Float(uCount) * radius / maxRadius)
        if count < uCount {
            var n = 2
            while count > 8 {
                count = count >> 1
                n += 1
            }
            count = 1 << n
        } else {
            count = uCount
        }
        
        var result = [IntPoint](repeating: .zero, count: count)
        let ic = iGeom.int(point: center)
        let s = uCount / count
        var j = 0
        for i in 0..<count {
            let p = CircleDefinition.unityPoints[j]
            let x = iGeom.int(float: radius * p.x)
            let y = iGeom.int(float: radius * p.y)
            result[i] = IntPoint(x: x + ic.x, y: y + ic.y)
            j += s
        }
        
        return result
    }
    
}
