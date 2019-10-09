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
    let interposition: Int // if slave and master same direction 1, other -1

    var isZeroLength: Bool { v0.point == v1.point }

    init(v0: PinPoint, v1: PinPoint, interposition: Int) {
        self.v0 = v0
        self.v1 = v1
        self.interposition = interposition
    }

    init(msPt0: Vertex, msPt1: Vertex, slPt0: Vertex, slPt1: Vertex) {
        let minMsPt: Vertex
        let maxMsPt: Vertex

        let isDirectMaster = msPt0.point.bitPack < msPt1.point.bitPack
        if isDirectMaster {
            minMsPt = msPt0
            maxMsPt = msPt1
        } else {
            minMsPt = msPt1
            maxMsPt = msPt0
        }

        let minSlPt: Vertex
        let maxSlPt: Vertex
        let isDirectSlave = slPt0.point.bitPack < slPt1.point.bitPack

        if isDirectSlave {
            minSlPt = slPt0
            maxSlPt = slPt1
        } else {
            minSlPt = slPt1
            maxSlPt = slPt0
        }

        // left end, case 1, 2

        let minMsStone: PathMileStone
        let minSlStone: PathMileStone
        let minCross: IntPoint
        if minMsPt.point.bitPack < minSlPt.point.bitPack {
            // a < b
            minCross = minSlPt.point
            minMsStone = msPt0.sqrDistance(stone: minCross)
            minSlStone = PathMileStone(index: minSlPt.index)
        } else if minMsPt.point != minSlPt.point {
            // a > b
            minCross = minMsPt.point
            minMsStone = PathMileStone(index: minMsPt.index)
            minSlStone = slPt0.sqrDistance(stone: minCross)
        } else {
            // a == b
            minCross = minMsPt.point
            minMsStone = PathMileStone(index: minMsPt.index)
            minSlStone = PathMileStone(index: minSlPt.index)
        }


        // right end, case 1, 2

        let maxMsStone: PathMileStone
        let maxSlStone: PathMileStone
        let maxCross: IntPoint

        if maxMsPt.point.bitPack < maxSlPt.point.bitPack {
            // a < b
            maxCross = maxMsPt.point
            maxMsStone = PathMileStone(index: maxMsPt.index)
            maxSlStone = slPt0.sqrDistance(stone: maxCross)
        } else if maxMsPt.point != maxSlPt.point {
            // a > b
            maxCross = maxSlPt.point
            maxMsStone = msPt0.sqrDistance(stone: maxCross)
            maxSlStone = PathMileStone(index: maxSlPt.index)
        } else {
            // a == b
            maxCross = maxMsPt.point
            maxMsStone = PathMileStone(index: maxMsPt.index)
            maxSlStone = PathMileStone(index: maxSlPt.index)
        }


        let pnt0: IntPoint
        let pnt1: IntPoint
        let masterMileStone0: PathMileStone
        let masterMileStone1: PathMileStone
        let slaveMileStone0: PathMileStone
        let slaveMileStone1: PathMileStone

        if isDirectMaster {
            pnt0 = minCross
            masterMileStone0 = minMsStone
            slaveMileStone0 = minSlStone

            pnt1 = maxCross
            masterMileStone1 = maxMsStone
            slaveMileStone1 = maxSlStone
        } else {
            pnt0 = maxCross
            masterMileStone0 = maxMsStone
            slaveMileStone0 = maxSlStone

            pnt1 = minCross
            masterMileStone1 = minMsStone
            slaveMileStone1 = minSlStone
        }

        self.v0 = PinPoint(point: pnt0, type: .null, masterMileStone: masterMileStone0, slaveMileStone: slaveMileStone0)
        self.v1 = PinPoint(point: pnt1, type: .null, masterMileStone: masterMileStone1, slaveMileStone: slaveMileStone1)
        self.interposition = isDirectMaster == isDirectSlave ? 1 : -1
    }
}


private extension Vertex {

    func sqrDistance(stone: IntPoint) -> PathMileStone {
        return PathMileStone(index: self.index, offset: self.point.sqrDistance(point: stone))
    }
}
