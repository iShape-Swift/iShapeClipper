//
//  Edge.swift
//  iShapeClipper
//
//  Created by Nail Sharipov on 06.04.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import iGeometry

public struct Edge {
    
    public static func isContain(a: IntPoint, b: IntPoint, p: IntPoint) -> Bool {
        let xTest = a.x >= b.x && a.x >= p.x && p.x >= b.x || a.x < b.x && b.x >= p.x && p.x >= a.x
        let yTest = a.y >= b.y && a.y >= p.y && p.y >= b.y || a.y < b.y && b.y >= p.y && p.y >= a.y
        if xTest && yTest {
            let m0 = (p.y - a.y) * (b.x - a.x)
            let m1 = (b.y - a.y) * (p.x - a.x)
            return m0 == m1
        }
        return false
    }
  
}
