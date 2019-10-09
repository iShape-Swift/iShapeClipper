//
//  PinPoint.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

public struct PinPoint {
    
    struct Def {
        
        let pt: IntPoint
        let ms0: IntPoint
        let ms1: IntPoint
        let sl0: IntPoint
        let sl1: IntPoint
        let masterMileStone: PathMileStone
        let slaveMileStone: PathMileStone

        init(
            pt: IntPoint,
            ms0: IntPoint,
            ms1: IntPoint,
            sl0: IntPoint,
            sl1: IntPoint,
            masterMileStone: PathMileStone,
            slaveMileStone: PathMileStone
        ) {
            self.pt = pt
            self.ms0 = ms0
            self.ms1 = ms1
            self.sl0 = sl0
            self.sl1 = sl1
            self.masterMileStone = masterMileStone
            self.slaveMileStone = slaveMileStone
        }
    }
    
    enum PinType: Int {
        case inside     = 1
        case in_out     = 2
        case in_null    = 3
        case null_in    = 4

        case null       = 0        // can be ignored
        
        case outside    = -1
        case out_in     = -2
        case out_null   = -3
        case null_out   = -4
    }
    

    static let empty = PinPoint(point: .zero, type: .null, masterMileStone: .zero, slaveMileStone: .zero)

    var point: IntPoint
    let type: PinType   // 1 - in, -1 - out, 2 in-out, -2 out-in
    var masterMileStone: PathMileStone
    var slaveMileStone: PathMileStone

    init(point: IntPoint, type: PinType, masterMileStone: PathMileStone, slaveMileStone: PathMileStone) {
        self.point = point;
        self.type = type;
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
        let isCCW0 = PinPoint.isCCW(a: def.pt, b: def.ms1, c: def.sl0);
        let isCCW1 = PinPoint.isCCW(a: def.pt, b: def.ms1, c: def.sl1);

        let type: PinType
        if isCCW0 == isCCW1 {
            type = isCCW0 ? .out_in : .in_out
        } else {
            type = isCCW0 ? .outside : .inside
        }

        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }


    static func buildOnSlave(def: Def) -> PinPoint {
        let isCCW0 = PinPoint.isCCW(a: def.pt, b: def.ms0, c: def.sl1);
        let isCCW1 = PinPoint.isCCW(a: def.pt, b: def.ms1, c: def.sl1);

        let type: PinType
        if isCCW0 == isCCW1 {
            type = isCCW0 ? .out_in : .in_out
        } else {
            type = isCCW0 ? .outside : .inside
        }

        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }


    static func buildOnCross(def: Def, iGeom: IntGeom) -> PinPoint {
        let corner = Corner(o: def.pt, a: def.ms0, b: def.ms1, iGeom: iGeom)

        let isSl0 = corner.isBetween(p: def.sl0, clockwise: true)
        let isSl1 = corner.isBetween(p: def.sl1, clockwise: true)

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
