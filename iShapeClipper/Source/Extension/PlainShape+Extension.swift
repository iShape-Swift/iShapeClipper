//
//  PlainShape+Extension.swift
//  iGeometry
//
//  Created by Nail Sharipov on 16.02.2020.
//

import iGeometry

public extension PlainShape {

    var pathes: [[IntPoint]] {
        let n = layouts.count
        var pathes = Array<[IntPoint]>()
        pathes.reserveCapacity(n)
        for i in 0..<n {
            let layout = self.layouts[i]
            let slice = self.points[layout.begin...layout.end]
            pathes.append(Array(slice))
        }
        return pathes
    }
}
