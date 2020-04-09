//
//  Corner.swift
//  iGeometry
//
//  Created by Nail Sharipov on 09.04.2020.
//

import Foundation
import iGeometry

struct Corner {

    private let o: IntPoint
    private let a: IntPoint
    private let b: IntPoint

    private let d0: DPoint
    private let da: DPoint
    private let db: DPoint
    
    private let isInnerCornerCW: Bool
    
    
    init(d0: DPoint, o: IntPoint, a: IntPoint, b: IntPoint) {
        self.d0 = d0
        self.da = DPoint(iPoint: a)
        self.db = DPoint(iPoint: b)
        self.o = o
        self.a = a
        self.b = b

        self.isInnerCornerCW = Corner.isClockWise(a: self.a, b: self.o, c: self.b) == 1
    }

    func isBetweenIntVersion(p: IntPoint, clockwise: Bool = false) -> Bool {
        let aop = Corner.isClockWise(a: a, b: o, c: p)
        let bop = Corner.isClockWise(a: b, b: o, c: p)
        guard aop != 0 && bop != 0 else {
            return clockwise != self.isInnerCornerCW
        }
        
        let isClockWiseAOP = aop == 1
        let isClockWiseBOP = bop == 1

        let isInner = isClockWiseAOP != isClockWiseBOP && self.isInnerCornerCW == isClockWiseAOP

        if isInnerCornerCW == clockwise {
            return isInner
        } else {
            return !isInner
        }
    }
    
    func isBetweenDoubleVersion(p: IntPoint, clockwise: Bool = false) -> Bool {
        let aop = Corner.isClockWise(a: a, b: o, c: p)
        let bop = Corner.isClockWise(a: b, b: o, c: p)
        guard aop != 0 && bop != 0 else {
            return clockwise != self.isInnerCornerCW
        }
        let dp = DPoint(iPoint: p)

        let dAOP = Corner.isClockWise(a: da, b: d0, c: dp)
        let dBOP = Corner.isClockWise(a: db, b: d0, c: dp)
        
        let isClockWiseAOP = dAOP == 1
        let isClockWiseBOP = dBOP == 1

        let isInner = isClockWiseAOP != isClockWiseBOP && self.isInnerCornerCW == isClockWiseAOP

        if isInnerCornerCW == clockwise {
            return isInner
        } else {
            return !isInner
        }
    }

    private static func isClockWise(a: DPoint, b: DPoint, c: DPoint) -> Int {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)

        if m0 < m1 {
            return -1
        } else if m0 > m1 {
            return 1
        }
        
        return 0
    }
    
    private static func isClockWise(a: IntPoint, b: IntPoint, c: IntPoint) -> Int {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)

        if m0 < m1 {
            return -1
        } else if m0 > m1 {
            return 1
        }
        
        return 0
    }

}
