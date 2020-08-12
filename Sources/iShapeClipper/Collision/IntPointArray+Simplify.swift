//
//  Simplifier.swift
//  iGeometry
//
//  Created by Nail Sharipov on 20.04.2020.
//

import iGeometry

extension Array where Element == IntPoint {
    
    
    mutating func simplify() {
        var n = self.count
        guard n > 3 else {
            return
        }

        var cross = IntPoint.zero
        var i0 = 0
        
        while i0 < n, n >= 4 {
            let i1 = (i0 + 1) % n
            let i2 = (i0 + 2) % n
            let i3 = (i0 + 3) % n
            
            let p0 = self[i0]
            let p1 = self[i1]
            let p2 = self[i2]
            let p3 = self[i3]
            
            let type = CrossResolver.isCross(a0: p0, a1: p1, b0: p2, b1: p3, cross: &cross)

            switch type {
            case .pure:
                if i1 < i2 {
                    self.remove(at: i2)
                    self[i1] = cross
                } else {
                    self.remove(at: i1)
                    self[i2] = cross
                }
                n = self.count
            case .end_a0, .end_b1, .end_a0_b0, .same_line:
                if i1 < i2 {
                    self.remove(at: i2)
                    self.remove(at: i1)
                } else {
                    self.remove(at: i1)
                    self.remove(at: i2)
                }
                n = self.count
            case .end_a1, .end_a1_b0:
                self.remove(at: i2)
                n = self.count
            case .end_b0:
                self.remove(at: i1)
                n = self.count
            case .end_a0_b1:
                if i1 < i3 {
                    self.remove(at: i3)
                    self.remove(at: i2)
                    self.remove(at: i1)
                } else if i1 < i2 { // i3 === 0
                    self.removeLast(2)
                    self.remove(at: 0)
                } else { // i3 === 1, i2 === 0
                    self.removeLast(1)
                    self.remove(at: 1)
                    self.remove(at: 0)
                }
                n = self.count
            case .end_a1_b1:
                if i2 < i3 {
                    self.remove(at: i3)
                    self.remove(at: i2)
                } else {
                    self.remove(at: i2)
                    self.remove(at: i3)
                }
                n = self.count
            default:
                i0 += 1
            }
        }

    }

}
