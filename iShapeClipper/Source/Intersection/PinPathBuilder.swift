//
//  PinPathBuilder.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

struct PinPathBuilder {
    
    private var pinEdges: [PinEdge]
    private let iGeom: IntGeom
    
    init(pinEdges: [PinEdge], iGeom: IntGeom) {
        self.pinEdges = pinEdges
        self.iGeom = iGeom
    }

    mutating func build(master: [IntPoint], slave: [IntPoint]) -> [PinPath] {
        let n = pinEdges.count
        if n == 0 {
            return []
        }

        sort()

        var mergedEdges = [PinEdge]()
        mergedEdges.reserveCapacity(n)

        var i = 0
        repeat {
            let edge = pinEdges[i]

            var v1 = edge.v1

            var j = i + 1

            while j < n {
                let next = pinEdges[j]

                // must be same or next edge
                if v1.masterMileStone == next.v0.masterMileStone {
                    j += 1
                    v1 = next.v1
                } else {
                    break
                }
            }

            let path = PinEdge(v0: edge.v0, v1: v1, interposition: edge.interposition)

            mergedEdges.append(path)

            i = j
        } while i < n

        if mergedEdges.count > 1 {
            let first = mergedEdges[0]
            let last = mergedEdges[mergedEdges.count - 1]

            if first.v0.masterMileStone == last.v1.masterMileStone {
                mergedEdges[0] = PinEdge(v0: last.v0, v1: first.v1, interposition: first.interposition)
                mergedEdges.removeLast();
            }
        }

        let pathList = createPath(edges: mergedEdges, master: master, slave: slave)

        return pathList;
    }

    private mutating func sort() {
        // this array is already sorted by edge index

        let n = pinEdges.count

        var isNotSorted: Bool

        var m = n

        repeat {
            isNotSorted = false;
            var a = pinEdges[0];
            var i = 1;
            while (i < m) {
                let b = pinEdges[i];
                if (PathMileStone.compare(a: a.v0.masterMileStone, b: b.v0.masterMileStone)) {
                    pinEdges[i - 1] = b;
                    isNotSorted = true;
                } else {
                    pinEdges[i - 1] = a;
                    a = b;
                }

                i += 1;
            }

            m -= 1;
            pinEdges[m] = a;
        } while (isNotSorted);
    }


    private func createPath(edges: [PinEdge], master: [IntPoint], slave: [IntPoint]) -> [PinPath] {
        let n = edges.count
        let emptyPin = PinPoint(point: .zero, type: 0, masterMileStone: .zero, slaveMileStone: .zero)
        var pathList = Array<PinPath>.init(repeating: .init(v0: emptyPin, v1: emptyPin, type: 0), count: n)
        for i in 0..<n {
            let edge = edges[i]
            let type = getType(edge: edge, master: master, slave: slave)
            let path = PinPath(v0: edge.v0, v1: edge.v1, type: type)
            pathList[i] = path
        }

        return pathList
    }

    private func getType(edge: PinEdge, master: [IntPoint], slave: [IntPoint]) -> Int {
        let type0 = getStartDisposition(vertex: edge.v0, master: master, slave: slave, iterposition: edge.interposition)
        let type1 = getEndDisposition(vertex: edge.v1, master: master, slave: slave, iterposition: edge.interposition)

        if type0 == PinPoint.Const.null || type1 == PinPoint.Const.null {
            if type0 > 0 || type1 > 0 {
                return PinPoint.Const.inside
            }

            if type0 < 0 || type1 < 0 {
                return PinPoint.Const.outside
            }

            return PinPoint.Const.null
        }


        if type0 == PinPoint.Const.in_null && type1 == PinPoint.Const.null_in ||
            type1 == PinPoint.Const.in_null && type0 == PinPoint.Const.null_in {
            return PinPoint.Const.inside
        }

        if type0 == PinPoint.Const.out_null && type1 == PinPoint.Const.null_out ||
            type1 == PinPoint.Const.out_null && type0 == PinPoint.Const.null_out {
            return PinPoint.Const.outside
        }

        if type0 == PinPoint.Const.out_null && type1 == PinPoint.Const.null_in ||
            type1 == PinPoint.Const.out_null && type0 == PinPoint.Const.null_in {
            return PinPoint.Const.out_in
        }

        if type0 == PinPoint.Const.in_null && type1 == PinPoint.Const.null_out ||
            type1 == PinPoint.Const.in_null && type0 == PinPoint.Const.null_out {
            return PinPoint.Const.in_out
        }

        // TODO assert fail
        return 0
    }

    private func getStartDisposition(vertex: PinPoint, master: [IntPoint], slave: [IntPoint], iterposition: Int) -> Int {
        let corner = PinPathBuilder.buildMasterCorner(vertex: vertex, master: master, iGeom: iGeom)

        let si = vertex.slaveMileStone.index
        let sn = slave.count
        let s: IntPoint

        if iterposition == -1 {
            s = slave[(si + 1) % sn]
        } else {
            s = vertex.slaveMileStone.offset != 0 ? slave[si] : slave[(si - 1 + sn) % sn]
        }

        let type: Int

        if corner.isOnBorder(p: s) {
            let  slaveCorner = PinPathBuilder.buildSlaveCorner(vertex: vertex, slave: slave, iGeom: iGeom)

            let mi = vertex.masterMileStone.index
            let mn = master.count
            let m: IntPoint

            if iterposition == -1 {
                m = master[(mi + 1) % mn]
            } else {
                m = vertex.masterMileStone.offset != 0 ? master[mi] : slave[(mi - 1 + mn) % mn]
            }

            let isBetween = slaveCorner.isBetween(p: m, clockwise: true)

            if iterposition == 1 {
                type = isBetween ? PinPoint.Const.in_null : PinPoint.Const.out_null
            } else {
                type = isBetween ? PinPoint.Const.null_out : PinPoint.Const.null_in
            }
        } else {
            let isBetween = corner.isBetween(p: s, clockwise: true)

            if iterposition == 1 {
                type = isBetween ? PinPoint.Const.in_null : PinPoint.Const.out_null
            } else {
                type = isBetween ? PinPoint.Const.null_out : PinPoint.Const.null_in
            }
        }

        return type
    }


    private func getEndDisposition(vertex: PinPoint, master: [IntPoint], slave: [IntPoint], iterposition: Int) -> Int {
        let i = vertex.slaveMileStone.index
        let n = slave.count
        let s: IntPoint

        if iterposition != 1 {
            s = vertex.slaveMileStone.offset != 0 ? slave[i] : slave[(i - 1 + n) % n]
        } else {
            s = slave[(i + 1) % n]
        }

        let corner = PinPathBuilder.buildMasterCorner(vertex: vertex, master: master, iGeom: iGeom)

        if corner.isOnBorder(p: s) {
            return PinPoint.Const.null
        }

        let isBetween = corner.isBetween(p: s, clockwise: true)

        let type: Int

        if iterposition == 1 {
            type = isBetween ? PinPoint.Const.null_out : PinPoint.Const.null_in
        } else {
            type = isBetween ? PinPoint.Const.in_null : PinPoint.Const.out_null
        }

        return type;
    }


    private static func buildMasterCorner(vertex: PinPoint, master: [IntPoint], iGeom: IntGeom) -> Corner {
        let mi = vertex.masterMileStone.index
        let mn = master.count
        let m1 = vertex.point
        let m2 = master[(mi + 1) % mn]

        let m0 = vertex.masterMileStone.offset != 0 ? master[mi] : master[(mi - 1 + mn) % mn]

        return Corner(o: m1, a: m0, b: m2, iGeom: iGeom)
    }


    private static func buildSlaveCorner(vertex: PinPoint, slave: [IntPoint], iGeom: IntGeom) -> Corner {
        let si = vertex.slaveMileStone.index
        let sn = slave.count

        let s1 = vertex.point
        let s2 = slave[(si + 1) % sn]

        let s0 = vertex.slaveMileStone.offset != 0 ? slave[si] : slave[(si - 1 + sn) % sn]

        return Corner(o: s1,a: s0,b: s2, iGeom: iGeom)
    }
    
}
