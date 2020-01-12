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
    case edge_cross     =  2    // one of the end is lying on others edge
    case common_end     =  3    // first master end is equal to one of slave ends
}

struct CrossResolver {

    /*
    static func defineType(a0: IntPoint, a1: IntPoint, b0: IntPoint, b1: IntPoint) -> CrossType {
        let d0 = CrossResolver.isCCW(a: a0, b: b0, c: b1)
        let d1 = CrossResolver.isCCW(a: a1, b: b0, c: b1)
        let d2 = CrossResolver.isCCW(a: a0, b: a1, c: b0)
        let d3 = CrossResolver.isCCW(a: a0, b: a1, c: b1)

        if (d0 != 0 || d1 != 0 || d2 != 0 || d3 != 0) {
            let t0 = d0 < 0
            let t1 = d1 < 0
            let t2 = d2 < 0
            let t3 = d3 < 0

            if t0 != t1 && t2 != t3 {
                if d0 != 0 && d1 != 0 && d2 != 0 && d3 != 0 {
                    return CrossType.pure
                }

                return CrossType.edge_cross
            }

            // TODO check corner case
            if a0 != b0 && a0 != b1 {
                return CrossType.not_cross
            }

            return CrossType.common_end
        }

        return CrossType.same_line
    }

    static func defineType(a0: IntPoint, a1: IntPoint, b0: IntPoint, b1: IntPoint, cross: inout IntPoint) -> CrossType {
        let d0 = CrossResolver.isCCW(a: a0, b: b0, c: b1)
        let d1 = CrossResolver.isCCW(a: a1, b: b0, c: b1)
        let d2 = CrossResolver.isCCW(a: a0, b: a1, c: b0)
        let d3 = CrossResolver.isCCW(a: a0, b: a1, c: b1)

        if (d0 != 0 || d1 != 0 || d2 != 0 || d3 != 0) {
            let t0 = d0 < 0
            let t1 = d1 < 0
            let t2 = d2 < 0
            let t3 = d3 < 0

            if t0 != t1 && t2 != t3 {
                if d0 != 0 && d1 != 0 && d2 != 0 && d3 != 0 {
                    cross = CrossResolver.cross(a0: a0, a1: a1, b0: b0, b1: b1)
                    if a0 == cross || a1 == cross || b0 == cross || b1 == cross {
                        return .edge_cross
                    } else {
                        return .pure
                    }
                }
                
                cross = CrossResolver.endCross(a0: a0, a1: a1, b0: b0, b1: b1)
                return .edge_cross
            }
            
            cross = .empty

            // TODO check corner case
            if a0 != b0 && a0 != b1 {
                return .not_cross
            }

            return .common_end
        }

        cross = .empty
        
        return .same_line
    }
    */
    
    static func defineType(a0: IntPoint, a1: IntPoint, b0: IntPoint, b1: IntPoint, cross c: inout IntPoint) -> CrossType {
        guard CrossResolver.cross(a0: a0, a1: a1, b0: b0, b1: b1, cross: &c) else {
            return .same_line
        }
        
        let isContain =
        (c.x >= a0.x && c.x <= a1.x || c.x <= a0.x && c.x >= a1.x) &&
        (c.y >= a0.y && c.y <= a1.y || c.y <= a0.y && c.y >= a1.y) &&
        (c.x >= b0.x && c.x <= b1.x || c.x <= b0.x && c.x >= b1.x) &&
        (c.y >= b0.y && c.y <= b1.y || c.y <= b0.y && c.y >= b1.y)
        
        guard isContain else {
            return .not_cross
        }
        
        let isA = a0 == c || a1 == c
        let isB = b0 == c || b1 == c
        
        if isA || isB {
            if isA && isB {
                return .common_end
            } else {
                return .edge_cross
            }
        }
        return .pure
    }
    
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

    private static func cross(a0: IntPoint, a1: IntPoint, b0: IntPoint, b1: IntPoint, cross: inout IntPoint) -> Int {
        let dxA = a0.x - a1.x
        let dyB = b0.y - b1.y
        let dyA = a0.y - a1.y
        let dxB = b0.x - b1.x
        
        let divider = dxA * dyB - dyA * dxB
        
        if divider != 0 {
            let xyA = Double(a0.x * a1.y - a0.y * a1.x)
            let xyB = Double(b0.x * b1.y - b0.y * b1.x)
            
            let invert_divider: Double = 1.0 / Double(divider)
            
            let x = xyA * Double(b0.x - b1.x) - Double(a0.x - a1.x) * xyB
            let y = xyA * Double(b0.y - b1.y) - Double(a0.y - a1.y) * xyB
            
            let cx = round(x * invert_divider)
            let cy = round(y * invert_divider)
            
            cross = IntPoint(x: Int64(cx), y: Int64(cy))
            return 0
        } else {
            
            
            
            return false
        }
    }
    
    /*
    private static func endCross(a0: IntPoint, a1: IntPoint, b0: IntPoint, b1: IntPoint) -> IntPoint {
        let p = self.cross(a0: a0, a1: a1, b0: b0, b1: b1)
        
        if a0 == p || a1 == p || b0 == p || b1 == p {
            return p
        }
        
        var dx = a0.x - p.x
        var dy = a0.y - p.y
        var dl = dx * dx + dy * dy
        var minP = a0
        var minL = dl
        
        dx = a1.x - p.x
        dy = a1.y - p.y
        dl = dx * dx + dy * dy
        
        if minL > dl {
            minP = a1
            minL = dl
        }
        
        dx = b0.x - p.x
        dy = b0.y - p.y
        dl = dx * dx + dy * dy
        
        if minL > dl {
            minP = b0
            minL = dl
        }
        
        dx = b1.x - p.x
        dy = b1.y - p.y
        dl = dx * dx + dy * dy
        
        if minL > dl {
            minP = b1
            minL = dl
        }
        
        return minP
    }
    */
}
