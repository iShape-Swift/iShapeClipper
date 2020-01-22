//
//  CrossResolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

enum CrossType: Int {
    case not_cross      = -1    // no intersections
    case same_line      =  0    // same line
    case pure           =  1    // simple intersection with no overlaps
    case end_a0         =  4
    case end_a1         =  5
    case end_b0         =  6
    case end_b1         =  7
    case end_a0_b0      =  8
    case end_a0_b1      =  9
    case end_a1_b0      =  10
    case end_a1_b1      =  11
}

struct CrossResolver {

    private static func isCCW(a: IntPoint, b: IntPoint, c: IntPoint) -> Int {
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
    
    private static func cross(a0: IntPoint, a1: IntPoint, b0: IntPoint, b1: IntPoint) -> IntPoint {
        let dxA = a0.x - a1.x
        let dyB = b0.y - b1.y
        let dyA = a0.y - a1.y
        let dxB = b0.x - b1.x
        
        let divider = dxA * dyB - dyA * dxB
        
        let xyA = Double(a0.x * a1.y - a0.y * a1.x)
        let xyB = Double(b0.x * b1.y - b0.y * b1.x)
        
        let invert_divider: Double = 1.0 / Double(divider)
        
        let x = xyA * Double(b0.x - b1.x) - Double(a0.x - a1.x) * xyB
        let y = xyA * Double(b0.y - b1.y) - Double(a0.y - a1.y) * xyB
        
        let cx = round(x * invert_divider)
        let cy = round(y * invert_divider)
        
        return IntPoint(x: Int64(cx), y: Int64(cy))
    }

    static func defineType(a0: IntPoint, a1: IntPoint, b0: IntPoint, b1: IntPoint, cross: inout IntPoint) -> CrossType {
        let d0 = CrossResolver.isCCW(a: a0, b: b0, c: b1)
        let d1 = CrossResolver.isCCW(a: a1, b: b0, c: b1)
        let d2 = CrossResolver.isCCW(a: a0, b: a1, c: b0)
        let d3 = CrossResolver.isCCW(a: a0, b: a1, c: b1)

        if d0 == 0 || d1 == 0 || d2 == 0 || d3 == 0 {
            if d0 == 0 && d1 == 0 && d2 == 0 && d3 == 0 {
                return .same_line
            }
            if d0 == 0 {
                cross = a0
                if d2 == 0 || d3 == 0 {
                    if d2 == 0 {
                        return .end_a0_b0
                    } else {
                        return .end_a0_b1
                    }
                } else if d2 != d3 {
                    return .end_a0
                } else {
                    return .not_cross
                }
            }
            if d1 == 0 {
                cross = a1
                if d2 == 0 || d3 == 0 {
                    if d2 == 0 {
                        return .end_a1_b0
                    } else {
                        return .end_a1_b1
                    }
                } else if d2 != d3 {
                    return .end_a1
                } else {
                    return .not_cross
                }
            }
            if d0 != d1 {
                if d2 == 0 {
                    cross = b0
                    return .end_b0
                } else {
                    cross = b1
                    return .end_b1
                }
            } else {
                return .not_cross
            }
        } else if d0 != d1 && d2 != d3 {
            cross = CrossResolver.cross(a0: a0, a1: a1, b0: b0, b1: b1)
            // still can be ends (watch case union 44)
            let isA0 = a0 == cross
            let isA1 = a1 == cross
            let isB0 = b0 == cross
            let isB1 = b1 == cross
            
            if !(isA0 || isA1 || isB0 || isB1) {
                return .pure
            } else if isA0 && isB0 {
                return .end_a0_b0
            } else if isA0 && isB1 {
                return .end_a0_b1
            } else if isA1 && isB0 {
                return .end_a1_b0
            } else if isA1 && isB1 {
                return .end_a1_b1
            } else if isA0 {
                return .end_a0
            } else if isA1 {
                return .end_a1
            } else if isB0 {
                return .end_b0
            } else {
                return .end_b1
            }
        } else {
            return .not_cross
        }
    }
}
