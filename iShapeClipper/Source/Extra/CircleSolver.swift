//
//  CircleSolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 11.06.2020.
//

import Foundation
import iGeometry

public extension Array where Element == CircleDefinition {
    
    func union(maxRadius: Float, iGeom: IntGeom) -> PlainShapeList {
        guard self.count > 2 else {
            if let circle = self.first {
                return PlainShapeList(plainShape: PlainShape(points: circle.getPath(maxRadius: maxRadius, iGeom: iGeom)))
            } else {
                return .empty
            }
        }
        
        // sort
        let circles = self.sorted(by: { $0.minX > $1.minX })

        var shapes = [PlainShape]()
        for circle in circles {
            let path = circle.getPath(maxRadius: maxRadius, iGeom: iGeom)
            shapes.union(path: path)
        }
        
        var result = PlainShapeList.empty
        
        for shape in shapes {
            result.add(plainShape: shape)
        }
        
        return result
    }
    
}
