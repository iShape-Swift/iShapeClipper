//
//  Polygon.swift
//  iGeometry
//
//  Created by Nail Sharipov on 26.12.2019.
//

import iGeometry

public extension Array where Element == IntPoint {
    
    var any: IntPoint {
        if self.count > 1 {
            let a = self[0]
            let b = self[1]
            return IntPoint(x: (a.x + b.x) >> 1, y: (a.y + b.y) >> 1)
        } else {
            return self[0]
        }
    }
    
    func anyInside(isClockWise: Bool) -> IntPoint {
        let n = self.count
        guard n > 1 else {
            return self[0]
        }
        
        let p0 = self[0]
        let p1 = self[1]

        let cx = (p0.x + p1.x) >> 1
        let cy = (p0.y + p1.y) >> 1
        let dx = Float(p1.x - p0.x)
        let dy = Float(p1.y - p0.y)
        let l = 1 / sqrt(dx * dx + dy * dy)
        let nx = -dy * l
        let ny = dx * l
        
        var n0x = Int64(round(nx))
        var n0y = Int64(round(ny))

        if isClockWise {
            n0x = -n0x
            n0y = -n0y
        }
        
        return IntPoint(x: cx + n0x, y: cy + n0y)
    }

    func isContain(point p: IntPoint) -> Bool {
        let n = self.count
        var isContain = false
        var b = self[n - 1]
        for i in 0..<n {
            let a = self[i]
            
            let isInRange = (a.y > p.y) != (b.y > p.y)
            if isInRange {
                let dx = b.x - a.x
                let dy = b.y - a.y
                let sx = (p.y - a.y) * dx / dy + a.x
                if p.x < sx {
                    isContain = !isContain
                }
            }
            b = a
        }

        return isContain
    }
    
    func isOverlap(points: [IntPoint]) -> Bool {
        let n = points.count
        var a = points[n - 1]
        for i in 0..<n {
            let b = points[i]
            let c = IntPoint(x: (a.x + b.x) >> 1, y: (a.y + b.y) >> 1)
            if self.isContain(point: c) {
                return true
            }
            a = b
        }

        return false
    }
    
    
    /// Is current path is contain the other one
    /// - Parameter path: test path
    /// - Parameter isClockWise: clock-wise order of hole
    /// - Parameter outFactor: if the path is a hole, it's hole factor value
    func isContain(hole: [IntPoint], isClockWise: Bool, outFactor: inout Int64) -> Bool {
        guard !hole.isEmpty else {
            return false
        }
        outFactor = Int64.min
        
        let p = hole.anyInside(isClockWise: isClockWise)
        
        let n = self.count
        var isContain = false
        var b = self[n - 1]
        for i in 0..<n {
            let a = self[i]
            
            let isInRange = (a.y > p.y) != (b.y > p.y)
            if isInRange {
                let dx = b.x - a.x
                let dy = b.y - a.y
                let sx = (p.y - a.y) * dx / dy + a.x
                if p.x < sx {
                    isContain = !isContain
                    if outFactor < sx {
                       outFactor = sx
                    }
                }
            }
            b = a
        }

        return isContain
    }
    
    func isContain(hole: [IntPoint], isClockWise: Bool) -> Bool {
        guard !hole.isEmpty else {
            return false
        }

        let p = hole.anyInside(isClockWise: isClockWise)
        
        let n = self.count
        var isContain = false
        var b = self[n - 1]
        for i in 0..<n {
            let a = self[i]
            
            let isInRange = (a.y > p.y) != (b.y > p.y)
            if isInRange {
                let dx = b.x - a.x
                let dy = b.y - a.y
                let sx = (p.y - a.y) * dx / dy + a.x
                if p.x < sx {
                    isContain = !isContain
                }
            }
            b = a
        }

        return isContain
    }
    
    func isContain(hole: [IntPoint], probeCount: Int = 5) -> Bool {
        guard !hole.isEmpty else {
            return false
        }
        let count = hole.count > probeCount ? probeCount : hole.count
        let step = hole.count / count
        var j = 0
        for _ in 0..<count {
            let p = hole[j]
            
            let n = self.count
            var isContain = false
            var b = self[n - 1]
            for i in 0..<n {
                let a = self[i]
                
                let isInRange = (a.y > p.y) != (b.y > p.y)
                if isInRange {
                    let dx = b.x - a.x
                    let dy = b.y - a.y
                    let sx = (p.y - a.y) * dx / dy + a.x
                    if p.x < sx {
                        isContain = !isContain
                    }
                }
                b = a
            }
            
            if !isContain {
                return false
            }

            j += step
        }

        return true
    }
    
    func isContain(hole: [IntPoint], isClockWise: Bool, outPoint: inout IntPoint) -> Bool {
        guard !hole.isEmpty else {
            return false
        }
        var outFactor = Int64.min
        
        let p = hole.anyInside(isClockWise: isClockWise)
        
        let n = self.count
        var isContain = false
        var b = self[n - 1]
        for i in 0..<n {
            let a = self[i]
            
            let isInRange = (a.y > p.y) != (b.y > p.y)
            if isInRange {
                let dx = b.x - a.x
                let dy = b.y - a.y
                let sx = (p.y - a.y) * dx / dy + a.x
                if p.x < sx {
                    isContain = !isContain
                    if outFactor < sx {
                       outFactor = sx
                    }
                }
            }
            b = a
        }
        
        outPoint = IntPoint(x: outFactor, y: p.y)

        return isContain
    }
}
