//
//  SubtractNavigator.swift
//  iGeometry
//
//  Created by Nail Sharipov on 21.11.2019.
//

import Foundation

struct SubtractNavigator {
    
    var navigator: PinNavigator
    var nextCursors: [Cursor]
    private var nextIndex: Int = 0
    
    init(navigator: PinNavigator) {
        self.navigator = navigator
        self.nextCursors = SubtractNavigator.nextCursors(navigator: navigator)
    }
    
    private static func nextCursors(navigator: PinNavigator) -> [Cursor] {
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
            if type == .inside || type == .out_in {
                cursors.append(Cursor(type: type, index: i))
            }
        }
        
        cursors.sort(by: { a, b in
            return a.type == .inside && b.type != .inside
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
    
}
