//
//  PinNavigatorBuilder.swift
//  iGeometry
//
//  Created by Nail Sharipov on 27.01.2020.
//

import Foundation

struct PinNavigatorBuilder {

    static func build(pinPointArray: inout [PinPoint], pinPathArray: inout [PinPath], masterCount: Int, hasExclusion: Bool) -> PinNavigator {
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
            return PinNavigator(slavePath: [], pinPathArray: [], pinPointArray: [], nodeArray: [], hasContacts: hasContacts)
        }

        PinNavigatorBuilder.sortMaster(handlerArray: &handlerArray)
        
        if pinPathArray.count > 0 {
            PinNavigatorBuilder.compact(handlerArray: &handlerArray, pinPointArray: &pinPointArray, pinPathArray: &pinPathArray)
        }

        if handlerArray.isEmpty {
            return PinNavigator(slavePath: [], pinPathArray: [], pinPointArray: [], nodeArray: [], hasContacts: hasContacts)
        }

        let slavePath = PinNavigatorBuilder.buildSlavePath(handlerArray: handlerArray, pinPointArray: pinPointArray, pinPathArray: pinPathArray)

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

        return PinNavigator(slavePath: slavePath, pinPathArray: pinPathArray, pinPointArray: pinPointArray, nodeArray: nodes, hasContacts: hasContacts)
    }

    private static func sortMaster(handlerArray: inout[PinHandler]) {
        // this array is mostly sorted

        let n = handlerArray.count

        var isNotSorted: Bool
        var m = n

        repeat {
            isNotSorted = false
            var a = handlerArray[0]
            var i = 1
            while i < m {
                let b = handlerArray[i]
                if PathMileStone.compare(a: a.masterSortFactor, b: b.masterSortFactor) {
                    handlerArray[i - 1] = b
                    isNotSorted = true
                } else {
                    handlerArray[i - 1] = a
                    a = b
                }

                i += 1
            }

            m -= 1
            handlerArray[m] = a
            
        } while isNotSorted
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
            if pinHandler.marker == 0 {
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

    private static func buildSlavePath(handlerArray: [PinHandler], pinPointArray: [PinPoint], pinPathArray: [PinPath]) -> [Int] {
        let n = handlerArray.count

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

        var isNotSorted: Bool

        var m = n

        repeat {
            isNotSorted = false
            var a = iStones[0]
            var i = 1
            while i < m {
                let b = iStones[i]
                if PathMileStone.compare(a: a.stone, b: b.stone) {
                    iStones[i - 1] = b
                    isNotSorted = true
                } else {
                    iStones[i - 1] = a
                    a = b
                }

                i += 1
            }

            m -= 1
            iStones[m] = a
        } while isNotSorted

        var indexArray = Array<Int>(repeating: 0, count: n)

        for j in 0..<n {
            indexArray[j] = iStones[j].index
        }

        return indexArray
    }
}
