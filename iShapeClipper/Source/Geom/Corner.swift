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

    private let a: IntPoint
    private let b: IntPoint
    private let o: IntPoint
    private let isInnerCornerCW: Bool
    
    init(o: IntPoint, a: IntPoint, b: IntPoint) {
        self.o = o
        self.a = a
        self.b = b
        self.isInnerCornerCW = Corner.isClockWise(a: a, b: o, c: b) == 1
    }

    func isBetween(p: IntPoint, clockwise: Bool = false) -> Bool {
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

    private static func isClockWise(a: IntPoint, b: IntPoint, c: IntPoint) -> Int {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)

        if m0 < m1 {
            return -1
        }
        
        if m0 > m1 {
            return 1
        }

        return 0
    }

}
