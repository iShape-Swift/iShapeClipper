//
//  PinEdge.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

struct PinEdge {
    var v0: PinPoint
    var v1: PinPoint
    let isDirect: Bool
    var isZeroLength: Bool { v0.point == v1.point }
    var type: PinPoint.PinType {
        if isDirect {
            return PinEdge.union(a: v0.type, b: v1.type)
        } else {
            return PinEdge.union(a: v1.type, b: v0.type)
        }
    }
    
    init(v0: PinPoint, v1: PinPoint, isDirect: Bool) {
        self.v0 = v0
        self.v1 = v1
        self.isDirect = isDirect
    }
    
    private static func union(a: PinPoint.PinType, b: PinPoint.PinType) -> PinPoint.PinType {
        guard a != b else {
            return a
        }

        switch a {
        case .outside, .out_in:
            switch b {
            case .outside, .in_out:
                return .outside
            case .inside, .out_in:
                return .out_in
            default:
                return .null
            }
        case .inside, .in_out:
            switch b {
            case .inside, .out_in:
                return .inside
            case .outside, .in_out:
                return .in_out
            default:
                return .null
            }
        default:
            return .null
        }
    }
}
