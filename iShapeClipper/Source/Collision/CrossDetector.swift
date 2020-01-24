//
//  CrossDetector.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

struct CrossDetector {
    
    private struct PinInfo {
        let index: Int
        let masterIndex: Int
        let slaveIndex: Int
        let cross: CrossType
    }
    
    internal static func findPins(iMaster: [IntPoint], iSlave: [IntPoint], iGeom: IntGeom, exclusionPinType: PinPoint.PinType) -> PinNavigator {
        let posMatrix = CrossDetector.createPossibilityMatrix(master: iMaster, slave: iSlave)
        
        let masterIndices = posMatrix.masterIndices
        let slaveIndices = posMatrix.slaveIndices
        
        var pinPoints = [PinPoint]()
        var pinInfoList = [PinInfo]()
        var pinEdges = [PinEdge]()
        
        let masterCount = iMaster.count
        let slaveCount = iSlave.count
        
        let n = masterIndices.count
        var i = 0
        
        let msLastIx = iMaster.count - 1
        let slLastIx = iSlave.count - 1
        
        var hasExclusion = false
        var endsCount = 0
        
        while i < n {
            let msIx0 = masterIndices[i]
            let msIx1 = msIx0 < msLastIx ? msIx0 + 1 : 0
            
            let ms0 = iMaster[msIx0]
            let ms1 = iMaster[msIx1]
            
            var j = i
            
            repeat {
                let slIx0 = slaveIndices[j]
                let slIx1 = slIx0 < slLastIx ? slIx0 + 1 : 0
                
                let sl0 = iSlave[slIx0]
                let sl1 = iSlave[slIx1]
                
                var point: IntPoint = .zero
                let crossType = CrossResolver.defineType(a0: ms0, a1: ms1, b0: sl0, b1: sl1, cross: &point)
                
                // .not_cross, .pure are the most possible cases (more then 99%)
                
                j += 1
                
                switch crossType {
                case .not_cross:
                    continue
                case .pure:
                    // simple intersection and most common case
                    
                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: ms0,
                        ms1: ms1,
                        sl0: sl0,
                        sl1: sl1,
                        masterMileStone: PathMileStone(index: msIx0, offset: ms0.sqrDistance(point: point)),
                        slaveMileStone: PathMileStone(index: slIx0, offset: sl0.sqrDistance(point: point))
                    )
                    
                    let pinPoint = PinPoint.buildSimple(def: pinPointDef)
                    
                    pinInfoList.append(PinInfo(index: pinPoints.count, masterIndex: msIx0, slaveIndex: slIx0, cross: crossType))
                    pinPoints.append(pinPoint)

                    continue
                case .end_a0:
                    let prevMs = (msIx0 - 1 + masterCount) % masterCount
                    let nextMs = msIx1
                    
                    let prevSl = slIx0
                    let nextSl = slIx1

                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: iMaster[prevMs],
                        ms1: iMaster[nextMs],
                        sl0: iSlave[prevSl],
                        sl1: iSlave[nextSl],
                        masterMileStone: PathMileStone(index: msIx0),
                        slaveMileStone: PathMileStone(index: slIx0, offset: sl0.sqrDistance(point: point))
                    )

                    let pinPoint = PinPoint.buildOnSlave(def: pinPointDef, iGeom: iGeom)
                    if (pinPoint.type != exclusionPinType) {
                        pinInfoList.append(PinInfo(index: pinPoints.count, masterIndex: msIx0, slaveIndex: slIx0, cross: crossType))
                        pinPoints.append(pinPoint)
                        endsCount += 1
                    } else {
                        hasExclusion = true
                    }

                    continue
                case .end_a1:
                    let prevMs = msIx0
                    let nextMs = (msIx1 + 1) % masterCount
                    
                    let prevSl = slIx0
                    let nextSl = slIx1

                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: iMaster[prevMs],
                        ms1: iMaster[nextMs],
                        sl0: iSlave[prevSl],
                        sl1: iSlave[nextSl],
                        masterMileStone: PathMileStone(index: msIx1),
                        slaveMileStone: PathMileStone(index: slIx0, offset: sl0.sqrDistance(point: point))
                    )

                    let pinPoint = PinPoint.buildOnSlave(def: pinPointDef, iGeom: iGeom)
                    if (pinPoint.type != exclusionPinType) {
                        pinInfoList.append(PinInfo(index: pinPoints.count, masterIndex: msIx0, slaveIndex: slIx0, cross: crossType))
                        pinPoints.append(pinPoint)
                        endsCount += 1
                    } else {
                        hasExclusion = true
                    }

                    continue
                case .end_b0:
                    let prevMs = msIx0
                    let nextMs = msIx1
                    
                    let prevSl = (slIx0 - 1 + slaveCount) % slaveCount
                    let nextSl = slIx1

                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: iMaster[prevMs],
                        ms1: iMaster[nextMs],
                        sl0: iSlave[prevSl],
                        sl1: iSlave[nextSl],
                        masterMileStone: PathMileStone(index: msIx0, offset: ms0.sqrDistance(point: point)),
                        slaveMileStone: PathMileStone(index: slIx0)
                    )
                    
                    let pinPoint = PinPoint.buildOnMaster(def: pinPointDef)
                    if (pinPoint.type != exclusionPinType) {
                        pinInfoList.append(PinInfo(index: pinPoints.count, masterIndex: msIx0, slaveIndex: slIx0, cross: crossType))
                        pinPoints.append(pinPoint)
                        endsCount += 1
                    } else {
                        hasExclusion = true
                    }
                    continue
                case .end_b1:
                    let prevMs = msIx0
                    let nextMs = msIx1
                    
                    let prevSl = slIx0
                    let nextSl = (slIx1 + 1) % slaveCount

                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: iMaster[prevMs],
                        ms1: iMaster[nextMs],
                        sl0: iSlave[prevSl],
                        sl1: iSlave[nextSl],
                        masterMileStone: PathMileStone(index: msIx0, offset: ms0.sqrDistance(point: point)),
                        slaveMileStone: PathMileStone(index: slIx1)
                    )
                    
                    let pinPoint = PinPoint.buildOnMaster(def: pinPointDef)
                    if (pinPoint.type != exclusionPinType) {
                        pinInfoList.append(PinInfo(index: pinPoints.count, masterIndex: msIx0, slaveIndex: slIx0, cross: crossType))
                        pinPoints.append(pinPoint)
                        endsCount += 1
                    } else {
                        hasExclusion = true
                    }
                    continue
                case .same_line:
                    // possible edge case
                    
                    let ms0Pt = Vertex(index: msIx0, point: ms0)
                    let ms1Pt = Vertex(index: msIx1, point: ms1)
                    let sl0Pt = Vertex(index: slIx0, point: sl0)
                    let sl1Pt = Vertex(index: slIx1, point: sl1)
                    
                    let pinEdge = PinEdge(msPt0: ms0Pt, msPt1: ms1Pt, slPt0: sl0Pt, slPt1: sl1Pt)
                    if !pinEdge.isZeroLength {
                        pinEdges.append(pinEdge)
                        continue
                    }
                    
                case .end_a0_b0:
                    let prevMs = (msIx0 - 1 + masterCount) % masterCount
                    let nextMs = msIx1

                    let prevSl = (slIx0 - 1 + slaveCount) % slaveCount
                    let nextSl = slIx1
                    
                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: iMaster[prevMs],
                        ms1: iMaster[nextMs],
                        sl0: iSlave[prevSl],
                        sl1: iSlave[nextSl],
                        masterMileStone: PathMileStone(index: msIx0),
                        slaveMileStone: PathMileStone(index: slIx0)
                    )
                    
                    let pinPoint = PinPoint.buildOnCross(def: pinPointDef, iGeom: iGeom)
                    if pinPoint.type != exclusionPinType {
                        pinInfoList.append(PinInfo(index: pinPoints.count, masterIndex: msIx0, slaveIndex: slIx0, cross: crossType))
                        pinPoints.append(pinPoint)
                        endsCount += 1
                    } else {
                        hasExclusion = true
                    }
                case .end_a0_b1:
                    let prevMs = (msIx0 - 1 + masterCount) % masterCount
                    let nextMs = msIx1

                    let prevSl = slIx0
                    let nextSl = (slIx1 + 1) % slaveCount
                    
                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: iMaster[prevMs],
                        ms1: iMaster[nextMs],
                        sl0: iSlave[prevSl],
                        sl1: iSlave[nextSl],
                        masterMileStone: PathMileStone(index: msIx0),
                        slaveMileStone: PathMileStone(index: slIx1)
                    )
                    
                    let pinPoint = PinPoint.buildOnCross(def: pinPointDef, iGeom: iGeom)
                    if pinPoint.type != exclusionPinType {
                        pinInfoList.append(PinInfo(index: pinPoints.count, masterIndex: msIx0, slaveIndex: slIx0, cross: crossType))
                        pinPoints.append(pinPoint)
                        endsCount += 1
                    } else {
                        hasExclusion = true
                    }
                
                case .end_a1_b0:
                    let prevMs = msIx0
                    let nextMs = (msIx1 + 1) % masterCount

                    let prevSl = (slIx0 - 1 + slaveCount) % slaveCount
                    let nextSl = slIx1
                    
                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: iMaster[prevMs],
                        ms1: iMaster[nextMs],
                        sl0: iSlave[prevSl],
                        sl1: iSlave[nextSl],
                        masterMileStone: PathMileStone(index: msIx1),
                        slaveMileStone: PathMileStone(index: slIx0)
                    )
                    
                    let pinPoint = PinPoint.buildOnCross(def: pinPointDef, iGeom: iGeom)
                    if pinPoint.type != exclusionPinType {
                        pinInfoList.append(PinInfo(index: pinPoints.count, masterIndex: msIx0, slaveIndex: slIx0, cross: crossType))
                        pinPoints.append(pinPoint)
                        endsCount += 1
                    } else {
                        hasExclusion = true
                    }
                case .end_a1_b1:
                    let prevMs = msIx0
                    let nextMs = (msIx1 + 1) % masterCount

                    let prevSl = slIx0
                    let nextSl = (slIx1 + 1) % slaveCount
                    
                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: iMaster[prevMs],
                        ms1: iMaster[nextMs],
                        sl0: iSlave[prevSl],
                        sl1: iSlave[nextSl],
                        masterMileStone: PathMileStone(index: msIx1),
                        slaveMileStone: PathMileStone(index: slIx1)
                    )
                    
                    let pinPoint = PinPoint.buildOnCross(def: pinPointDef, iGeom: iGeom)
                    if pinPoint.type != exclusionPinType {
                        pinInfoList.append(PinInfo(index: pinPoints.count, masterIndex: msIx0, slaveIndex: slIx0, cross: crossType))
                        pinPoints.append(pinPoint)
                        endsCount += 1
                    } else {
                        hasExclusion = true
                    }
                }
            } while j < n && msIx0 == masterIndices[j]
            
            i = j
        }
        
        if iMaster.count == iSlave.count && iMaster.count == pinEdges.count {
            if iMaster == iSlave {
                return PinNavigator()
            }
        }

        if endsCount > 0 {
            CrossDetector.removeDoubles(pinPoints: &pinPoints)
        }
        
        if !pinEdges.isEmpty {
            CrossDetector.removePinOnEdges(pinPoints: &pinPoints, pinEdges: pinEdges)
        }
        
        // merge all edges
        var builder = PinPathBuilder(pinEdges: pinEdges, iGeom: iGeom)
        
        // build pin paths from edges
        let result = builder.build(master: iMaster, slave: iSlave)
        
        guard result.pathType != .equal else {
            return PinNavigator()
        }
        
        // combine pin points and paths
        var sequence = PinSequence(pinPointArray: pinPoints, pinPathArray: result.pinPath, masterCount: iMaster.count)
        
        // remove doubles and organize data
        let navigator = sequence.convert(exclusionPinType: exclusionPinType, hasExclusion: hasExclusion)
        
        return navigator
    }
    
    
    private static func createPossibilityMatrix(master: [IntPoint], slave: [IntPoint]) -> AdjacencyMatrix {
        var slaveBoxArea = Rect.empty
        
        var slaveSegmentsBoxAreas = [Rect]()
        slaveSegmentsBoxAreas.reserveCapacity(16)
        
        let lastSlaveIndex = slave.count - 1
        
        for i in 0...lastSlaveIndex {
            let a = slave[i]
            let b = slave[i != lastSlaveIndex ? i + 1 : 0]
            
            slaveBoxArea.assimilate(p: a)
            slaveSegmentsBoxAreas.append(Rect(a: a, b: b))
        }
        
        var posMatrix = AdjacencyMatrix(size: 0)
        
        let lastMasterIndex = master.count - 1
        
        for i in 0...lastMasterIndex {
            let master_0 = master[i]
            let master_1 = master[i != lastMasterIndex ? i + 1 : 0]
            
            let isIntersectionImpossible = slaveBoxArea.isNotIntersecting(a: master_0, b: master_1)
            
            if isIntersectionImpossible {
                continue
            }
            
            let segmentRect = Rect(a: master_0, b: master_1)
            for j in 0...lastSlaveIndex {
                let isIntersectionPossible = slaveSegmentsBoxAreas[j].isIntersecting(rect: segmentRect)
                
                if isIntersectionPossible {
                    posMatrix.addMate(master: i, slave: j)
                }
            }
        }
        
        return posMatrix
    }
    
    private static func removeDoubles(pinPoints: inout [PinPoint]) {
        var i = 0
        while i < pinPoints.count - 1 {
            let a = pinPoints[i]
            if a.masterMileStone.offset == 0 || a.slaveMileStone.offset == 0 {
                var j = i + 1
                while j < pinPoints.count {
                    let b = pinPoints[j]
                    if a.masterMileStone == b.masterMileStone && a.slaveMileStone == b.slaveMileStone {
                        pinPoints.remove(at: j)
                        break
                    }
                    j -= 1
                }
            }
            i += 1
        }
    }
    
    private static func removePinOnEdges(pinPoints: inout [PinPoint], pinEdges: [PinEdge]) {
        let n = pinPoints.count
        let m = pinEdges.count
        var i = n - 1
        while i >= 0 {
            let a = pinPoints[i]
            for j in 0..<m {
                let e = pinEdges[j]
                if a.masterMileStone == e.v0.masterMileStone && a.slaveMileStone == e.v0.slaveMileStone ||
                    a.masterMileStone == e.v1.masterMileStone && a.slaveMileStone == e.v1.slaveMileStone {
                    pinPoints.remove(at: i)
                    break
                }
            }
            i -= 1
        }
    }
    
    private static func findZEdges(pinPoints: inout [PinPoint], masterCount mCnt: Int) -> [PinEdge] {
        pinPoints.sort(by: { PathMileStone.compare(a: $0.masterMileStone, b: $1.masterMileStone) })
        
        var a = pinPoints[0]
        var i = 1
        
        while i < pinPoints.count {
            let b = pinPoints[i]
            
            let aMi = a.masterMileStone.index
            let bMi = b.masterMileStone.index
            let isNextEnd = b.masterMileStone.offset == 0
            
            let isSameMaster = aMi == bMi || (isNextEnd && (aMi - 1 + mCnt) % mCnt == aMi)
            
            if isSameMaster {
                
                
                
                
            }
            
        }

        return []
    }
    
    
}
