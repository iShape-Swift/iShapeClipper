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

        let masterCount = iMaster.count
        let slaveCount = iSlave.count
        
        let n = masterIndices.count
        var i = 0

        let msLastIx = iMaster.count - 1
        let slLastIx = iSlave.count - 1

        var endsCount = 0

        // mark indices which are on the common path
        var masterIndexMark = [Bool](repeating: false, count: iMaster.count)
        var slaveIndexMark = [Bool](repeating: false, count: iSlave.count)
        
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
                case .not_cross, .same_line:
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
                case .end_a0:
                    masterIndexMark[msIx0] = true
                    
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
                    pinPoints.append(pinPoint)
                    endsCount += 1
                case .end_a1:
                    masterIndexMark[msIx1] = true
                    
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
                    pinPoints.append(pinPoint)
                    endsCount += 1
                case .end_b0:
                    slaveIndexMark[slIx0] = true
                    
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
                    pinPoints.append(pinPoint)
                    endsCount += 1
                case .end_b1:
                    slaveIndexMark[slIx1] = true
                    
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
                    pinPoints.append(pinPoint)
                    endsCount += 1
                case .end_a0_b0:
                    masterIndexMark[msIx0] = true
                    slaveIndexMark[slIx0] = true
                    
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
                    pinPoints.append(pinPoint)
                    endsCount += 1
                case .end_a0_b1:
                    masterIndexMark[msIx0] = true
                    slaveIndexMark[slIx1] = true
                    
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
                    pinPoints.append(pinPoint)
                    endsCount += 1
                case .end_a1_b0:
                    masterIndexMark[msIx1] = true
                    slaveIndexMark[slIx0] = true
                    
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
                    pinPoints.append(pinPoint)
                    endsCount += 1
                case .end_a1_b1:
                    masterIndexMark[msIx1] = true
                    slaveIndexMark[slIx1] = true
                    
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
                    pinPoints.append(pinPoint)
                    endsCount += 1
                }
            } while j < n && msIx0 == masterIndices[j]
            
            i = j
        }
        
        let anyMaster = masterIndexMark.firstIndex(of: false) ?? -1
        let anySlave = slaveIndexMark.firstIndex(of: false) ?? -1
        
        var pinPaths: [PinPath]
        var hasExclusion = false
        if endsCount > 0 {
            pinPaths = CrossDetector.organize(pinPoints: &pinPoints, masterCount: masterCount, slaveCount: slaveCount)
            if !pinPaths.isEmpty {
                
                // test for same shapes
                if pinPaths.count == 1 && iMaster.count == iSlave.count && pinPaths[0].isClosed {
                    return PinNavigator()
                }
                
                hasExclusion = CrossDetector.removeExclusion(pinPaths: &pinPaths, exclusion: exclusionPinType)
            }
        } else {
            pinPaths = []
        }
        
        if !pinPoints.isEmpty {
            let pinExclusion = CrossDetector.removeExclusion(pinPoints: &pinPoints, exclusion: exclusionPinType)
            hasExclusion = pinExclusion || hasExclusion
        }

        let navigator = CrossDetector.buildNavigator(
            pinPointArray: &pinPoints,
            pinPathArray: &pinPaths,
            masterCount: iMaster.count,
            hasExclusion: hasExclusion,
            anyMaster: anyMaster,
            anySlave: anySlave
        )
        
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

            if !slaveBoxArea.isNotIntersecting(a: master_0, b: master_1) {
                let segmentRect = Rect(a: master_0, b: master_1)
                for j in 0...lastSlaveIndex {
                    let isIntersectionPossible = slaveSegmentsBoxAreas[j].isIntersecting(rect: segmentRect)
                    
                    if isIntersectionPossible {
                        posMatrix.addMate(master: i, slave: j)
                    }
                }
            }
        }
        
        return posMatrix
    }

    private static func organize(pinPoints: inout [PinPoint], masterCount: Int, slaveCount: Int) -> [PinPath] {
        pinPoints.sort(by: { a, b in
            a.masterMileStone < b.masterMileStone
        })
        
        CrossDetector.removeDoubles(pinPoints: &pinPoints)
        
        if pinPoints.count > 1 {
            return CrossDetector.findEdges(pinPoints: &pinPoints, masterCount: masterCount, slaveCount: slaveCount)
        }
        
        return []
    }
    
    private static func removeDoubles(pinPoints: inout [PinPoint]) {
        let n = pinPoints.count
        var a = pinPoints[0]
        var i = 1
        var removeIndex = [Int]()
        while i < n {
            let b = pinPoints[i]
            if a == b {
                removeIndex.append(i)
            }
            a = b
            i += 1
        }
        
        if !removeIndex.isEmpty {
            var j = removeIndex.count - 1
            while j >= 0 {
                pinPoints.remove(at: removeIndex[j])
                j -= 1
            }
        }
    }
    
    private static func findEdges(pinPoints: inout [PinPoint], masterCount: Int, slaveCount: Int) -> [PinPath] {
        var edges = [PinEdge]()
        let n = pinPoints.count
        
        var isPrevEdge = false
        
        var i: Int = 0
        var j: Int = n - 1

        var a = pinPoints[j]
        var removeMark = Array<Bool>.init(repeating: false, count: n)
        
        while i < n {
            let b = pinPoints[i]

            let aMi = a.masterMileStone.index
            let bMi = b.masterMileStone.index

            let isSameMaster = aMi == bMi || (b.masterMileStone.offset == 0 && (aMi + 1) % masterCount == bMi)
            
            if isSameMaster &&
                CrossDetector.isDirect(a: a.masterMileStone, b: b.masterMileStone, module: masterCount) &&
                CrossDetector.same(a: a.slaveMileStone, b: b.slaveMileStone, module: slaveCount) {
                if isPrevEdge {
                    var prevEdge = edges[edges.count - 1]
                    prevEdge.v1 = b
                    edges[edges.count - 1] = prevEdge
                } else {
                    let isDirectSlave = CrossDetector.isDirect(a: a.slaveMileStone, b: b.slaveMileStone, module: slaveCount)
                    edges.append(PinEdge(v0: a, v1: b, isDirect: isDirectSlave))
                }
                removeMark[i] = true
                removeMark[j] = true
                isPrevEdge = true
            } else {
                isPrevEdge = false
            }
            a = b
            j = i
            i += 1
        }

        if edges.count > 0 {
            var i = n - 1
            while i >= 0 {
                if removeMark[i] {
                    pinPoints.remove(at: i)
                }
                i -= 1
            }

            if edges.count > 1 {
                var first = edges[0]
                let last = edges[edges.count - 1]
                if first.v0 == last.v1 {
                    first.v0 = last.v0
                    edges[0] = first
                    edges.removeLast()
                }
            }
            
            var pinPaths = Array<PinPath>()
            pinPaths.reserveCapacity(edges.count)
            for i in 0..<edges.count {
                pinPaths.append(PinPath(edge: edges[i]))
            }
            return pinPaths
        } else {
            return []
        }
    }

    private static func same(a: PathMileStone, b: PathMileStone, module: Int) -> Bool {
        guard a.index != b.index else {
            return true
        }
        
        if b.offset == 0 && (a.index + 1) % module == b.index {
            return true
        } else if a.offset == 0 && (b.index + 1) % module == a.index {
            return true
        }
        
        return false
    }
    
    private static func isDirect(a: PathMileStone, b: PathMileStone, module: Int) -> Bool {
        guard a.index != b.index else {
            return a.offset < b.offset
        }
        
        return b.offset == 0 && (a.index + 1) % module == b.index
    }
    
    private static func removeExclusion(pinPoints: inout [PinPoint], exclusion: PinPoint.PinType) -> Bool {
        var i = pinPoints.count - 1
        var result = false
        repeat {
            let pin = pinPoints[i]
            if pin.type == exclusion {
                pinPoints.remove(at: i)
                result = true
            }
            i -= 1
        } while i >= 0
        return result
    }
    
    private static func removeExclusion(pinPaths: inout [PinPath], exclusion: PinPoint.PinType) -> Bool {
        var i = pinPaths.count - 1
        var result = false
        repeat {
            let path = pinPaths[i]
            if path.v0.type == exclusion {
                pinPaths.remove(at: i)
                result = true
            }
            i -= 1
        } while i >= 0
        return result
    }
    
    /// Build  Navigator section
    
    private static func buildNavigator(pinPointArray: inout [PinPoint], pinPathArray: inout [PinPath], masterCount: Int, hasExclusion: Bool, anyMaster: Int, anySlave: Int) -> PinNavigator {
        var handlerArray = [PinHandler]()
        handlerArray.reserveCapacity(pinPathArray.count + pinPointArray.count)

        var i = 0
        while i < pinPathArray.count {
            let path = pinPathArray[i]

            let pathHandlers = path.extract(index: i, pathCount: masterCount)

            handlerArray.append(contentsOf: pathHandlers)

            i += 1
        }

        i = 0
        while i < pinPointArray.count {
            handlerArray.append(PinHandler(pinPoint: pinPointArray[i], index: i))
            i += 1
        }
        
        let hasContacts = hasExclusion || !handlerArray.isEmpty

        if handlerArray.isEmpty {
            return PinNavigator(slavePath: [], pinPathArray: [], pinPointArray: [], nodeArray: [], hasContacts: hasContacts, anyMaster: anyMaster, anySlave: anySlave)
        }
        
        if pinPathArray.count > 0 {
            CrossDetector.compact(handlerArray: &handlerArray, pinPointArray: &pinPointArray, pinPathArray: &pinPathArray)
        }

        if handlerArray.isEmpty {
            return PinNavigator(slavePath: [], pinPathArray: [], pinPointArray: [], nodeArray: [], hasContacts: hasContacts, anyMaster: anyMaster, anySlave: anySlave)
        }
        
        let slavePath = CrossDetector.streamline(handlerArray: &handlerArray, pinPointArray: pinPointArray, pinPathArray: pinPathArray)

        let n = slavePath.count

        var nodes = Array<PinNavigator.PinNode>(repeating: .empty, count: n)
        for j in 0..<n {
            var node = nodes[j]
            let handler = handlerArray[j]
            node.isPinPath = handler.isPinPath
            node.index = handler.index
            node.masterIndex = j
            nodes[j] = node

            let slaveIndex = slavePath[j]
            node = nodes[slaveIndex]
            node.slaveIndex = j
            nodes[slaveIndex] = node
        }

        return PinNavigator(slavePath: slavePath, pinPathArray: pinPathArray, pinPointArray: pinPointArray, nodeArray: nodes, hasContacts: hasContacts, anyMaster: anyMaster, anySlave: anySlave)
    }

    private static func compact(handlerArray: inout [PinHandler], pinPointArray: inout [PinPoint], pinPathArray: inout [PinPath]) {
        var paths = [PinPath]()
        var points = [PinPoint]()
        var handlers = [PinHandler]()
        paths.reserveCapacity(pinPathArray.count)
        points.reserveCapacity(pinPointArray.count)

        let n = handlerArray.count
        for i in 0..<n {
            let pinHandler = handlerArray[i]
            if pinHandler.marker {
                let index = pinHandler.index
                if pinHandler.isPinPath {
                    let path = pinPathArray[index]
                    paths.append(path)

                    let handler = PinHandler(sortFactor: pinHandler.masterSortFactor, index: paths.count - 1, isPinPath: true, type: pinHandler.type)
                    handlers.append(handler)
                } else {
                    let pin = pinPointArray[index]
                    points.append(pin)

                    let handler = PinHandler(sortFactor: pinHandler.masterSortFactor, index: points.count - 1, isPinPath: false, type: pinHandler.type)
                    handlers.append(handler)
                }
            }
        }

        pinPathArray = paths
        pinPointArray = points
        handlerArray = handlers
    }

    private static func streamline(handlerArray: inout [PinHandler], pinPointArray: [PinPoint], pinPathArray: [PinPath]) -> [Int] {
        let n = handlerArray.count

        handlerArray.sort(by: { a, b in
            a.masterSortFactor < b.masterSortFactor
        })
        
        var iStones = Array<IndexMileStone>(repeating: IndexMileStone(index: 0, stone: .zero), count: n)

        for j in 0..<n {
            let handler = handlerArray[j]
            let index = handler.index
            if !handler.isPinPath {
                let point = pinPointArray[index]
                iStones[j] = IndexMileStone(index: j, stone: point.slaveMileStone)
            } else {
                let path = pinPathArray[index]
                iStones[j] = IndexMileStone(index: j, stone: path.v0.slaveMileStone)
            }
        }

        iStones.sort() { a, b in
            a.stone < b.stone
        }

        var indexArray = Array<Int>(repeating: 0, count: n)

        for j in 0..<n {
            indexArray[j] = iStones[j].index
        }

        return indexArray
    }
    
}
