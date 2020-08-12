//
//  PinNavigator.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

struct PinNavigator {
    
    struct PinNode {
        static let empty = PinNode(isPinPath: false, masterIndex: 0, slaveIndex: 0, marker: 0, index: 0)
        var isPinPath: Bool     // 0 - false, 1 - true
        var masterIndex: Int    // index in master path array
        var slaveIndex: Int     // index in slave path array
        var marker: Int         // 0 - present, 1 - removed
        var index: Int          // index in supply array (PinPoints or PinPaths)
    }

    let isEqual: Bool
    let hasContacts: Bool
    let masterBox: Rect
    let slaveBox: Rect
    
    // for s in slavePath { nodeArray[s] }  iterate all pins in counter clockwise order by slave path
    private let slavePath: [Int]

#if DEBUG
    let pinPathArray: [PinPath]
    let pinPointArray: [PinPoint]
    var nodeArray: [PinNode]
#else
    // pinPathArray[nodeArray[i].index] return PinPath for this pin
    private let pinPathArray: [PinPath]
    // supply array for nodeArray[i].index return PinPoint for this pin
    private let pinPointArray: [PinPoint]
    // keep info about each pin node, also for n in nodeArray iterate all pins in clockwise order by master path
    private var nodeArray: [PinNode]
#endif
    
    
    init(slavePath: [Int], pinPathArray: [PinPath], pinPointArray: [PinPoint], nodeArray: [PinNode], hasContacts: Bool, masterBox: Rect, slaveBox: Rect) {
        self.slavePath = slavePath
        self.pinPathArray = pinPathArray
        self.pinPointArray = pinPointArray
        self.nodeArray = nodeArray
        self.isEqual = false
        self.hasContacts = hasContacts
        self.masterBox = masterBox
        self.slaveBox = slaveBox
    }
    
    init() {
        self.slavePath = []
        self.pinPathArray = []
        self.pinPointArray = []
        self.nodeArray = []
        self.isEqual = true
        self.masterBox = .empty
        self.slaveBox = .empty
        self.hasContacts = false
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
                let type: PinPoint.PinType
                if !node.isPinPath {
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

        if !nextNode.isPinPath {
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

        if !nextNode.isPinPath {
            let pin = pinPointArray[nextNode.index]
            return Cursor(type: pin.type, index: index)
        }

        let path = pinPathArray[nextNode.index]
        return Cursor(type: path.v0.type, index: index)
    }
    
    func prevMaster(cursor: Cursor) -> Cursor {
        let node = nodeArray[cursor.index]

        let n = nodeArray.count
        let prevMasterIndex = (node.masterIndex - 1 + n) % n
        let index = prevMasterIndex
        let prevNode = nodeArray[index]

        if !prevNode.isPinPath {
            let pin = pinPointArray[prevNode.index]
            return Cursor(type: pin.type, index: index)
        }

        let path = pinPathArray[prevNode.index]
        return Cursor(type: path.v0.type, index: index)
    }

    func masterStartStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if node.isPinPath == false {
            let pin = pinPointArray[node.index]
            return pin.masterMileStone
        }

        let path = pinPathArray[node.index]
        return path.v0.masterMileStone
    }


    func masterEndStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if !node.isPinPath {
            let pin = pinPointArray[node.index]
            return pin.masterMileStone
        }

        let path = pinPathArray[node.index]
        return path.v1.masterMileStone
    }

    func masterStartPoint(cursor: Cursor) -> IntPoint {
        let node = nodeArray[cursor.index]
        if !node.isPinPath {
            let pin = pinPointArray[node.index]
            return pin.point
        }

        let path = pinPathArray[node.index]
        return path.v0.point
    }


    func masterEndPoint(cursor: Cursor) -> IntPoint{
        let node = nodeArray[cursor.index]
        if node.isPinPath == false {
            let pin = pinPointArray[node.index]
            return pin.point
        }

        let path = pinPathArray[node.index]
        return path.v1.point
    }


    func slaveStartStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if !node.isPinPath {
            let pin = pinPointArray[node.index]
            return pin.slaveMileStone
        }

        let path = pinPathArray[node.index]
        return path.v0.slaveMileStone
    }


    func slaveStartPoint(cursor: Cursor) -> IntPoint {
        let node = nodeArray[cursor.index]
        if !node.isPinPath {
            let pin = pinPointArray[node.index]
            return pin.point
        }

        let path = pinPathArray[node.index]
        return path.v0.point
    }


    func slaveEndStone(cursor: Cursor) -> PathMileStone {
        let node = nodeArray[cursor.index]
        if !node.isPinPath {
            let pin = pinPointArray[node.index]
            return pin.slaveMileStone
        }

        let path = pinPathArray[node.index]
        return path.v1.slaveMileStone
    }


    func slaveEndPoint(cursor: Cursor) -> IntPoint {
        let node = nodeArray[cursor.index]
        if !node.isPinPath {
            let pin = pinPointArray[node.index]
            return pin.point
        }

        let path = pinPathArray[node.index]
        return path.v1.point
    }

}
