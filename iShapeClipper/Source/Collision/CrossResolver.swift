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
}
