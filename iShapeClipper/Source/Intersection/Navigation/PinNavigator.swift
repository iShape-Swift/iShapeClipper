//
//  PinNavigator.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

struct PinNavigator {
    
    struct PinNode {
        static let empty = PinNode(isPinPath: 0, masterIndex: 0, slaveIndex: 0, marker: 0, index: 0)
        var isPinPath: Int      // 0 - false, 1 - true
        var masterIndex: Int    // index in master path array
        var slaveIndex: Int     // index in slave path array
        var marker: Int         // 0 - present, 1 - removed
        var index: Int          // index in supply array (PinPoints or PinPaths)
    }
    
    // for s in slavePath { nodeArray[s] }  iterate all pins in counter clockwise order by slave path
    private let slavePath: [Int]

#if iShapeTest
    let pinPathArray: [PinPath]
    let pinPointArray: [PinPoint]
#else
    // pinPathArray[nodeArray[i].index] return PinPath for this pin
    private let pinPathArray: [PinPath]
    // supply array for nodeArray[i].index return PinPoint for this pin
    private let pinPointArray: [PinPoint]
#endif

    // keep info about each pin node, also for n in nodeArray iterate all pins in clockwise order by master path
    private var nodeArray: [PinNode]

    init(slavePath: [Int], pinPathArray: [PinPath], pinPointArray: [PinPoint], nodeArray: [PinNode]) {
        self.slavePath = slavePath
        self.pinPathArray = pinPathArray
        self.pinPointArray = pinPointArray
        self.nodeArray = nodeArray
    }


    func next(cursor: Cursor) -> Cursor {
        return next(index: cursor.index)
    }

    func next() -> Cursor {
        return self.nodeArray.count != 0 ? next(index: 0) : .empty
    }


    private func next(index: Int) -> Cursor {
        var i = index
        let n = nodeArray.count
        repeat {
            let node = nodeArray[i]
            if node.marker == 0 {
                let type: Int
                if node.isPinPath == 0 {
                    let pin = pinPointArray[node.index]
                    type = pin.type
                } else {
                    let path = pinPathArray[node.index]
                    type = path.v0.type
                }

                return Cursor(type: type, index: i)
            }

            i = (i + 1) % n
        } while i != index

        return .empty
    }


    mutating func mark(cursor: Cursor) {
        var node = nodeArray[cursor.index]
        node.marker = 1
        nodeArray[cursor.index] = node
    }


    func nextSlave(cursor: Cursor) -> Cursor {
        let node = nodeArray[cursor.index]

        let n = slavePath.count
        let nextSlaveIndex = (node.slaveIndex + 1) % n
        let index = slavePath[nextSlaveIndex]
        let nextNode = nodeArray[index]

        if nextNode.isPinPath == 0 {
            let pin = pinPointArray[nextNode.index]
            return Cursor(type: pin.type, index: index)
        }

        let path = pinPathArray[nextNode.index]
        return Cursor(type: path.v0.type, index: index)
    }


    func nextMaster(cursor: Cursor) -> Cursor {
        let node = nodeArray[cursor.index]

        let n = nodeArray.count
        let nextMasterIndex = (node.masterIndex + 1) % n
        let index = nextMasterIndex
        let nextNode = nodeArray[index]

        if nextNode.isPinPath == 0 {
            let pin = pinPointArray[nextNode.index]
            return Cursor(type: pin.type, index: index)
        }

        let path = pinPathArray[nextNode.index]
        return Cursor(type: path.v0.type, index: index)
    }

    func masterStartStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.masterMileStone
        }

        let path = pinPathArray[node.index]
        return path.v0.masterMileStone
    }


    func masterEndStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index];
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.masterMileStone
        }

        let path = pinPathArray[node.index]
        return path.v1.masterMileStone
    }

    func masterStartPoint(cursor: Cursor) -> IntPoint {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.point
        }

        let path = pinPathArray[node.index]
        return path.v0.point
    }


    func masterEndPoint(cursor: Cursor) -> IntPoint{
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.point
        }

        let path = pinPathArray[node.index];
        return path.v1.point;
    }


    func slaveStartStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.slaveMileStone
        }

        let path = pinPathArray[node.index]
        return path.v0.slaveMileStone;
    }


    func slaveStartPoint(cursor: Cursor) -> IntPoint {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.point
        }

        let path = pinPathArray[node.index]
        return path.v0.point
    }


    func slaveEndStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.slaveMileStone
        }

        let path = pinPathArray[node.index]
        return path.v1.slaveMileStone
    }


    func slaveEndPoint(cursor: Cursor) -> IntPoint {
        let node = nodeArray[cursor.index]
        if node.isPinPath == 0 {
            let pin = pinPointArray[node.index]
            return pin.point
        }

        let path = pinPathArray[node.index]
        return path.v1.point
    }

}
