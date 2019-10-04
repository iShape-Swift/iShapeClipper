//
//  Corner.swift
//  iShapeClipper
//
//  Created by Nail Sharipov on 04/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Foundation
import iGeometry

struct Corner {
    
    private let basis: IntPoint
    private let a: IntPoint
    private let b: IntPoint
    private let o: IntPoint
    private let projection: Int64
    private let isCWS: Bool
    private let iGeom: IntGeom
    
    init(o: IntPoint, a: IntPoint, b: IntPoint, iGeom: IntGeom) {
        self.o = o
        self.a = a
        self.b = b
        
        self.basis = IntPoint(x: o.x - a.x, y: o.y - a.y).normal(iGeom: iGeom)
        let satellite = IntPoint(x: o.x - b.x, y: o.y - b.y).normal(iGeom: iGeom)
        
        self.projection = basis.scalarMultiply(point: satellite)
        self.isCWS = Corner.isCCWDirection(a: a, b: o, c: b)
        self.iGeom = iGeom
    }

    func isBetween(p: IntPoint, clockwise: Bool = false) -> Bool {
        let target = IntPoint(x: o.x - p.x, y: o.y - p.y).normal(iGeom: iGeom)
        let targetProjection = basis.scalarMultiply(point: target)
        let isTragetCWS = Corner.isCCWDirection(a: a, b: o, c: p)

        let result: Bool
        
        if self.isCWS && isTragetCWS {
            result = targetProjection > self.projection
        } else if (!self.isCWS && !isTragetCWS) {
            result = targetProjection < self.projection
        } else {
            result = !self.isCWS
        }

        return result != clockwise
    }
    
    func isOnBorder(p: IntPoint) -> Bool {
        let dir = p - o
        let testA = Corner.isSameDirection(a: a - o, b: dir)
        let testB = Corner.isSameDirection(a: b - o, b: dir)

        return testA || testB
    }
    
    private static func isSameDirection(a: IntPoint, b: IntPoint) -> Bool {
        let isSameLine = a.x * b.y == a.y * b.x
        let isSameDirection = a.x * b.x >= 0 && a.y * b.y >= 0
        return isSameLine && isSameDirection
    }
    
    
    private static func isCCWDirection(a: IntPoint, b: IntPoint, c: IntPoint) -> Bool {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)
        
        return m0 < m1
    }

}
