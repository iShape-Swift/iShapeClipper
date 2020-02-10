//
//  PlainShape+Extension.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 10.02.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import iGeometry

extension PlainShape {

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
