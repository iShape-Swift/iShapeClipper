//
//  PinPoint.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry
    /*
 
 1 in
 2 in-out
 3 in-0
 4 0-in
 
-1 out
-2 out-in
-3 out-0
-4 0-out
 
*/

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
    
    enum Const {
        static let null = 0 // can be ignored

        static let inside = 1
        static let in_out = 2
        static let in_null = 3
        static let null_in = 4

        static let outside = -1
        static let out_in = -2
        static let out_null = -3
        static let null_out = -4
    }

    static let empty = PinPoint(point: .zero, type: 0, masterMileStone: .zero, slaveMileStone: .zero)

    var point: IntPoint
    let type: Int   // 1 - in, -1 - out, 2 in-out, -2 out-in
    var masterMileStone: PathMileStone
    var slaveMileStone: PathMileStone

    init(point: IntPoint, type: Int, masterMileStone: PathMileStone, slaveMileStone: PathMileStone) {
        self.point = point;
        self.type = type;
        self.masterMileStone = masterMileStone;
        self.slaveMileStone = slaveMileStone;
    }

    init(pin: PinPoint, type: Int) {
        self.point = pin.point
        self.type = type
        self.masterMileStone = pin.masterMileStone
        self.slaveMileStone = pin.slaveMileStone
    }
    
    static func buildSimple(def: Def) -> PinPoint {
        let isCCW = PinPoint.isCCW(a: def.ms1, b: def.pt, c: def.sl1);
        let type = isCCW ? -1 : 1;
        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }


    static func buildOnMaster(def: Def) -> PinPoint {
        let isCCW0 = PinPoint.isCCW(a: def.pt, b: def.ms1, c: def.sl0);
        let isCCW1 = PinPoint.isCCW(a: def.pt, b: def.ms1, c: def.sl1);

        let type: Int
        if isCCW0 == isCCW1 {
            type = isCCW0 ? -2 : 2
        } else {
            type = isCCW0 ? -1 : 1
        }

        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }


    static func buildOnSlave(def: Def) -> PinPoint {
        let isCCW0 = PinPoint.isCCW(a: def.pt, b: def.ms0, c: def.sl1);
        let isCCW1 = PinPoint.isCCW(a: def.pt, b: def.ms1, c: def.sl1);

        let type: Int
        if isCCW0 == isCCW1 {
            type = isCCW0 ? -2 : 2;
        } else {
            type = isCCW0 ? -1 : 1;
        }

        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }


    static func buildOnCross(def: Def, iGeom: IntGeom) -> PinPoint {
        let corner = Corner(o: def.pt, a: def.ms0, b: def.ms1, iGeom: iGeom)

        let isSl0 = corner.isBetween(p: def.sl0, clockwise: true)
        let isSl1 = corner.isBetween(p: def.sl1, clockwise: true)

        let type: Int
        if isSl0 && isSl1 {
            type = 2
        } else if !isSl0 && !isSl1 {
            type = -2
        } else {
            type = isSl0 ? 1 : -1
        }

        return PinPoint(point: def.pt, type: type, masterMileStone: def.masterMileStone, slaveMileStone: def.slaveMileStone)
    }


    private static func isCCW(a: IntPoint, b: IntPoint, c: IntPoint) -> Bool {
        let m0 = (c.y - a.y) * (b.x - a.x)
        let m1 = (b.y - a.y) * (c.x - a.x)

        return m0 < m1
    }
}
