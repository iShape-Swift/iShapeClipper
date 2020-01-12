//
//  CrossDetector.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

struct CrossDetector {
    
    internal static func findPins(iMaster: [IntPoint], iSlave: [IntPoint], iGeom: IntGeom, exclusionPinType: PinPoint.PinType) -> PinNavigator {
        let posMatrix = CrossDetector.createPossibilityMatrix(master: iMaster, slave: iSlave)
        
        let masterIndices = posMatrix.masterIndices
        let slaveIndices = posMatrix.slaveIndices
        
        var pinPoints = [PinPoint]()
        var pinEdges = [PinEdge]()
        
        let masterCount = iMaster.count
        let slaveCount = iSlave.count
        
        let n = masterIndices.count
        var i = 0
        
        let msLastIx = iMaster.count - 1
        let slLastIx = iSlave.count - 1
        
        var hasExclusion = false
        
        var extremePointIndices = [Int]()
        
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
                let intersectionTest = CrossResolver.defineType(a0: ms0, a1: ms1, b0: sl0, b1: sl1, cross: &point)
                
                // .not_cross, .pure are the most possible cases (more then 99%)
                
                // .not_cross - no intersections
                // .pure - simple intersection with no overlaps

                // .same_line, .edge_cross are very specific, but still possible cases
                
                // .same_line - same line
                // .edge_cross - one of the end is lying on others edge
                
                // case when one on of slave ends is overlapped by on of the master ends
                // can conflict with possible edge case
                
                j += 1
                
                switch intersectionTest {
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
                    pinPoints.append(pinPoint)
                    
                    continue
                    
                case .edge_cross:
                    // one of the end is lying on others edge
                    
                    let isMsEnd = ms0 == point || ms1 == point
                    let isSlEnd = sl0 == point || sl1 == point
                    
                    // skip case when on of the slave end is equal to one of the master end
                    if !(isMsEnd && isSlEnd) {
                        var prevMs = msIx0
                        var nextMs = msIx1
                        
                        var prevSl = slIx0
                        var nextSl = slIx1
                        
                        var masterEdge = msIx0
                        var masterOffset: Int64 = 0
                        
                        var slaveEdge = slIx0
                        var slaveOffset: Int64 = 0
                        
                        if isMsEnd {
                            if ms0 == point {
                                prevMs = (msIx0 - 1 + masterCount) % masterCount
                            } else {
                                nextMs = (msIx1 + 1) % masterCount
                                masterEdge = msIx1
                            }
                            slaveOffset = sl0.sqrDistance(point: point)
                        }
                        
                        if isSlEnd {
                            if sl0 == point {
                                prevSl = (slIx0 - 1 + slaveCount) % slaveCount
                            } else {
                                slaveEdge = slIx1
                                nextSl = (slIx1 + 1) % slaveCount
                            }
                            
                            masterOffset = ms0.sqrDistance(point: point)
                        }
                        
                        let pinPointDef = PinPoint.Def(
                            pt: point,
                            ms0: iMaster[prevMs],
                            ms1: iMaster[nextMs],
                            sl0: iSlave[prevSl],
                            sl1: iSlave[nextSl],
                            masterMileStone: PathMileStone(index: masterEdge, offset: masterOffset),
                            slaveMileStone: PathMileStone(index: slaveEdge, offset: slaveOffset)
                        )
                        
                        
                        let pinPoint: PinPoint
                        if isMsEnd {
                            // pin point is on slave
                            pinPoint = PinPoint.buildOnSlave(def: pinPointDef)
                        } else {
                            // pin point is on master
                            pinPoint = PinPoint.buildOnMaster(def: pinPointDef)
                        }
                        extremePointIndices.append(pinPoints.count)
                        pinPoints.append(pinPoint)
                        
                        
                        // TODO exclusion
                        /*
                        if isMsEnd {
                            // pin point is on slave
                            let pinPoint = PinPoint.buildOnSlave(def: pinPointDef)
                            
                            
                            if pinPoint.type != exclusionPinType {
                                pinPoints.append(pinPoint)
                            } else {
                                hasExclusion = true
                            }
                            
                        } else if isSlEnd {
                            // pin point is on master
                            let pinPoint = PinPoint.buildOnMaster(def: pinPointDef)
                            extremePointIndices.append(pinPoints.count)
                            pinPoints.append(pinPoint)
                            
                            // TODO exclusion
                            
                            if pinPoint.type != exclusionPinType {
                                pinPoints.append(pinPoint)
                            } else {
                                hasExclusion = true
                            }
                            
                        }
                        */
                        continue
                    }
                    
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
                    
                case .common_end:
                    break
                }
                
                // TODO check edge_cross && common_end 2, 3
                
                // only 0, 2, 3 cases are possible here
                
//                assert(intersectionTest != .edge_cross, "impossible")
                
                // lets ignore case for second end (it just add double)
                let isFirstPointCross = ms0 == sl0 || ms0 == sl1
                
                if isFirstPointCross {
                    let point = ms0
                    
                    let masterIndex = msIx0
                    let slaveIndex: Int
                    
                    let prevMs = (msIx0 - 1 + masterCount) % masterCount
                    let nextMs = msIx1
                    
                    var prevSl = slIx0
                    var nextSl = slIx1
                    
                    if sl0 == point {
                        slaveIndex = slIx0
                        prevSl = (slIx0 - 1 + slaveCount) % slaveCount
                    } else {
                        slaveIndex = slIx1
                        nextSl = (slIx1 + 1) % slaveCount
                    }
                    
                    let pinPointDef = PinPoint.Def(
                        pt: point,
                        ms0: iMaster[prevMs],
                        ms1: iMaster[nextMs],
                        sl0: iSlave[prevSl],
                        sl1: iSlave[nextSl],
                        masterMileStone: PathMileStone(index: masterIndex),
                        slaveMileStone: PathMileStone(index: slaveIndex)
                    )
                    
                    let pinPoint = PinPoint.buildOnCross(def: pinPointDef, iGeom: iGeom)
                    if pinPoint.type != exclusionPinType {
                        pinPoints.append(pinPoint)
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
        
        if !extremePointIndices.isEmpty {
            CrossDetector.excludeExtremePoints(pinPoints: &pinPoints, pinEdges: &pinEdges, indices: extremePointIndices, masterCount: masterCount, slaveCount: slaveCount)
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
    
    // Cause float precision there are some cases when non parallel lines give parallel edges
    // PinPathTests 24, 25, 26, 27
    private static func excludeExtremePoints(pinPoints: inout [PinPoint], pinEdges: inout[PinEdge], indices: [Int], masterCount: Int, slaveCount: Int) {
        // pinPoints is very small array ~ [1...10] points

        // find all pins with the same slave and master index

        let n = pinPoints.count
        var removePoints = [Int]()

    }
    
}
