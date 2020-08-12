//
//  FilterNavigator.swift
//  iGeometry
//
//  Created by Nail Sharipov on 22.11.2019.
//

import iGeometry

struct FilterNavigator {
    
    var navigator: PinNavigator
    var nextCursors: [Cursor]
    private var nextIndex: Int = 0
    
    var first: Cursor {
        if nextCursors.count > 0 {
            return self.nextCursors[0]
        }
        
        return .empty
    }

    var hasEdge: Bool {
        return !navigator.isEmpty
    }
    
    init(navigator: PinNavigator, primary: PinPoint.PinType, secondary: PinPoint.PinType) {
        self.navigator = navigator
        self.nextCursors = FilterNavigator.getCursors(navigator: navigator, primary: primary, secondary: secondary)
    }
    
    private static func getCursors(navigator: PinNavigator, primary: PinPoint.PinType, secondary: PinPoint.PinType) -> [Cursor] {
        let n = navigator.nodeArray.count
        var cursors = Array<Cursor>()
        cursors.reserveCapacity(n)
        for i in 0..<n {
            let node = navigator.nodeArray[i]
            let type: PinPoint.PinType
            if !node.isPinPath {
                let pin = navigator.pinPointArray[node.index]
                type = pin.type
            } else {
                let path = navigator.pinPathArray[node.index]
                type = path.v0.type
            }
            if type == primary || type == secondary {
                cursors.append(Cursor(type: type, index: i))
            }
        }
        
        cursors.sort(by: { a, b in
            return a.type == primary && b.type != primary
        })

        return cursors
    }
    
    mutating func next() -> Cursor {
        while nextIndex < nextCursors.count {
            let next = self.nextCursors[nextIndex]
            let node = self.navigator.nodeArray[next.index]
            self.nextIndex += 1
            if node.marker != 1 {
                return next
            }
        }
        
        return .empty
    }
    
    func nature(master: [IntPoint], slave: [IntPoint], isSlaveClockWise: Bool) -> Solution.Nature {
        guard !navigator.isEqual else {
            return .equal
        }
        let cursor = self.first
        if cursor.isNotEmpty {
            return .overlap
        } else if self.navigator.hasContacts {
            if self.navigator.masterBox.isInside(rect: self.navigator.slaveBox) && master.isContain(hole: slave, isClockWise: isSlaveClockWise) {
                return .masterIncludeSlave
            }
            if self.navigator.slaveBox.isInside(rect: self.navigator.masterBox) && slave.isContain(hole: master, isClockWise: true) {
                return .slaveIncludeMaster
            }
            return .notOverlap
        } else if master.isContain(point: slave[0]) {
            return .masterIncludeSlave
        } else if slave.isContain(point: master[0]) {
            return .slaveIncludeMaster
        } else {
            return .notOverlap
        }
    }
}
