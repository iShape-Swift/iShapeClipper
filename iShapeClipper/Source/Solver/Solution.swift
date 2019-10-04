//
//  Solution.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

public struct Solution {
    
    public enum Disposition {
        case noIntersections
        case hasIntersections
        case slaveInsideMaster
    }

    public let shapes: [PlainShape]
    public let disposition: Disposition

    init(shapes: [PlainShape], disposition: Disposition) {
        self.shapes = shapes
        self.disposition = disposition
    }
}
