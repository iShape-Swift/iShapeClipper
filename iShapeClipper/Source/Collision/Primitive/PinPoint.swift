//
//  PinPoint.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

public struct PinPoint {
    
    struct Def {

        let dp: DBPoint
        let pt: IntPoint
        let ms0: IntPoint
        let ms1: IntPoint
        let sl0: IntPoint
        let sl1: IntPoint
        let masterMileStone: PathMileStone
        let slaveMileStone: PathMileStone

        init(
            dp: DBPoint,
            pt: IntPoint,
            ms0: IntPoint,
            ms1: IntPoint,
            sl0: IntPoint,
            sl1: IntPoint,
            masterMileStone: PathMileStone,
            slaveMileStone: PathMileStone
        ) {
            self.dp = dp
            self.pt = pt
            self.ms0 = ms0
            self.ms1 = ms1
            self.sl0 = sl0
            self.sl1 = sl1
            self.masterMileStone = masterMileStone
            self.slaveMileStone = slaveMileStone
        }
    }
    
    // slave behavior over master path
    
    enum PinType: Int {
        case inside     = 1
        case in_out     = 2

        case null       = 0        // can be ignored
        
        case outside    = -1
        case out_in     = -2
    }
    

    static let empty = PinPoint(point: .zero, type: .null, masterMileStone: .zero, slaveMileStone: .zero)

    var point: IntPoint
    let type: PinType   // 1 - in, -1 - out, 2 in-out, -2 out-in
    var masterMileStone: PathMileStone
    var slaveMileStone: PathMileStone

    init(point: IntPoint, type: PinType, masterMileStone: PathMileStone, slaveMileStone: PathMileStone) {
        self.point = point
        self.type = type
        self.masterMileStone = masterMileStone
        self.slaveMileStone = slaveMileStone
    }

    init(pin: PinPoint, type: PinType) {
        self.point = pin.point
        self.type = type
        self.masterMileStone = pin.masterMileStone
        self.slaveMileStone = pin.slaveMileStone
    }
    
    static func buildSimple(def: Def) -> PinPoint {
        let isCCW = PinPoint.isCCW(a: def.ms1, b: def.pt, c: def.sl1)
        let type: PinType = isCCW ? .outside : .inside
        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }

    static func buildOnMaster(def: Def) -> PinPoint {
        let corner = Corner(d0: def.dp, o: def.pt, a: def.ms0, b: def.ms1)
        
        let s0 = corner.isBetweenDoubleVersion(p: def.sl0, clockwise: true)
        let s1 = corner.isBetweenDoubleVersion(p: def.sl1, clockwise: true)
        
        let type: PinType
        
        if s0 == .onBoarder || s1 == .onBoarder {
            if s0 == .onBoarder && s1 == .onBoarder {
                type = .null
            } else if s0 != .onBoarder {
                type = s0 == .contain ? .inside : .outside
            } else {
                type = s1 == .contain ? .outside : .inside
            }
        } else {
            let isSl0 = s0 == .contain
            let isSl1 = s1 == .contain
            
            if isSl0 && isSl1 {
                type = .in_out
            } else if !isSl0 && !isSl1 {
                type = .out_in
            } else {
                type = isSl0 ? .inside : .outside
            }
        }

        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }

    static func buildOnSlave(def: Def) -> PinPoint {
        let corner = Corner(d0: def.dp, o: def.pt, a: def.ms0, b: def.ms1)
        
        let s0 = corner.isBetweenDoubleVersion(p: def.sl0, clockwise: true)
        let s1 = corner.isBetweenDoubleVersion(p: def.sl1, clockwise: true)
        
        let type: PinType
        
        if s0 == .onBoarder || s1 == .onBoarder {
            if s0 == .onBoarder && s1 == .onBoarder {
                type = .null
            } else if s0 != .onBoarder {
                type = s0 == .contain ? .inside : .outside
            } else {
                type = s1 == .contain ? .outside : .inside
            }
        } else {
            let isSl0 = s0 == .contain
            let isSl1 = s1 == .contain
            
            if isSl0 && isSl1 {
                type = .in_out
            } else if !isSl0 && !isSl1 {
                type = .out_in
            } else {
                type = isSl0 ? .inside : .outside
            }
        }
        
        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }

    static func buildOnCross(def: Def) -> PinPoint {
        let corner = Corner(d0: def.dp, o: def.pt, a: def.ms0, b: def.ms1)

        let isSl0 = corner.isBetweenIntVersion(p: def.sl0, clockwise: true) == .contain
        let isSl1 = corner.isBetweenIntVersion(p: def.sl1, clockwise: true) == .contain

        let type: PinType
        if isSl0 && isSl1 {
            type = .in_out
        } else if !isSl0 && !isSl1 {
            type = .out_in
        } else {
            type = isSl0 ? .inside : .outside
        }

        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }

    private static func isCCW(a: IntPoint, b: IntPoint, c: IntPoint) -> Bool {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)

        return m0 < m1
    }
}

extension PinPoint: Equatable {

    public static func == (lhs: PinPoint, rhs: PinPoint) -> Bool {
        return lhs.masterMileStone == rhs.masterMileStone && lhs.slaveMileStone == rhs.slaveMileStone
    }
}
