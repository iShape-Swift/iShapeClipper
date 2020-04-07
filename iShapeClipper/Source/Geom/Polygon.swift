//
//  Polygon.swift
//  iGeometry
//
//  Created by Nail Sharipov on 26.12.2019.
//

import iGeometry

public extension Array where Element == IntPoint {

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
    
    func isContain(path: [IntPoint], probeCount: Int = 5) -> Bool {
        let length = path.count
        guard length != 0 else {
            return false
        }
        let count = length > probeCount ? probeCount : length
        let step = length / count
        var j = 0
        repeat {
            let p = path[j]
            
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
                
                if Edge.isContain(a: a, b: b, p: p) {
                    isContain = true
                    break
                }

                b = a
            }
            
            if !isContain {
                return false
            }

            j += step
        } while j < length

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
