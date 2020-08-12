//
//  Corner.swift
//  iGeometry
//
//  Created by Nail Sharipov on 09.04.2020.
//

import iGeometry

struct Corner {

    enum Result {
        case onBoarder
        case contain
        case absent
    }
    
    private let o: IntPoint
    private let a: IntPoint
    private let b: IntPoint

    private let d0: DBPoint
    private let da: DBPoint
    private let db: DBPoint
    
    private let isInnerCornerCW: Bool
    
    
    init(d0: DBPoint, o: IntPoint, a: IntPoint, b: IntPoint) {
        self.d0 = d0
        self.da = DBPoint(iPoint: a)
        self.db = DBPoint(iPoint: b)
        self.o = o
        self.a = a
        self.b = b

        self.isInnerCornerCW = Corner.isClockWise(a: self.a, b: self.o, c: self.b) == 1
    }
    
    init(o: IntPoint, a: IntPoint, b: IntPoint) {
        self.d0 = DBPoint(iPoint: o)
        self.da = DBPoint(iPoint: a)
        self.db = DBPoint(iPoint: b)
        self.o = o
        self.a = a
        self.b = b

        self.isInnerCornerCW = Corner.isClockWise(a: self.a, b: self.o, c: self.b) == 1
    }

    func isBetweenIntVersion(p: IntPoint, clockwise: Bool) -> Result {
        let aop = Corner.isClockWise(a: a, b: o, c: p)
        let bop = Corner.isClockWise(a: b, b: o, c: p)
        guard aop != 0 && bop != 0 else {
            if aop == 0 && bop == 0 {
                return .onBoarder
            }
            let dotProduct: Int64
            if aop == 0 {
                let ao = a - o
                let po = p - o
                dotProduct = ao.x * po.x + ao.y * po.y
            } else {
                let bo = b - o
                let po = p - o
                dotProduct = bo.x * po.x + bo.y * po.y
            }
            if dotProduct > 0 {
                return .onBoarder
            } else if clockwise == self.isInnerCornerCW {
                return .absent
            } else {
                return .contain
            }
        }
        
        let isClockWiseAOP = aop == 1
        let isClockWiseBOP = bop == 1

        var isInner = isClockWiseAOP != isClockWiseBOP && self.isInnerCornerCW == isClockWiseAOP

        if isInnerCornerCW != clockwise {
            isInner = !isInner
        }
        
        if isInner {
            return .contain
        } else {
            return .absent
        }
    }
    
    func isBetweenDoubleVersion(p: IntPoint, clockwise: Bool = false) -> Result {
        let aop = Corner.isClockWise(a: a, b: o, c: p)
        let bop = Corner.isClockWise(a: b, b: o, c: p)
        guard aop != 0 && bop != 0 else {
            if aop == 0 && bop == 0 {
                return .onBoarder
            }
            let dotProduct: Int64
            if aop == 0 {
                let ao = a - o
                let po = p - o
                dotProduct = ao.x * po.x + ao.y * po.y
            } else {
                let bo = b - o
                let po = p - o
                dotProduct = bo.x * po.x + bo.y * po.y
            }
            if dotProduct > 0 {
                return .onBoarder
            } else if clockwise == self.isInnerCornerCW {
                return .absent
            } else {
                return .contain
            }
        }
        let dp = DBPoint(iPoint: p)

        let dAOP = Corner.isClockWise(a: da, b: d0, c: dp)
        let dBOP = Corner.isClockWise(a: db, b: d0, c: dp)
        
        let isClockWiseAOP = dAOP == 1
        let isClockWiseBOP = dBOP == 1

        var isInner = isClockWiseAOP != isClockWiseBOP && self.isInnerCornerCW == isClockWiseAOP

        if isInnerCornerCW != clockwise {
            isInner = !isInner
        }
        
        if isInner {
            return .contain
        } else {
            return .absent
        }
    }

    private static func isClockWise(a: DBPoint, b: DBPoint, c: DBPoint) -> Int {
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
