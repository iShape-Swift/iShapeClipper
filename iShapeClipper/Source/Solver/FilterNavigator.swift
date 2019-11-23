//
//  FilterNavigator.swift
//  iGeometry
//
//  Created by Nail Sharipov on 22.11.2019.
//

import Foundation

struct FilterNavigator {
    
    var navigator: PinNavigator
    var nextCursors: [Cursor]
    private var nextIndex: Int = 0
    
    init(navigator: PinNavigator, primary: PinPoint.PinType, secondary: PinPoint.PinType) {
        self.navigator = navigator
        self.nextCursors = FilterNavigator.nextCursors(navigator: navigator, primary: primary, secondary: secondary)
    }
    
    private static func nextCursors(navigator: PinNavigator, primary: PinPoint.PinType, secondary: PinPoint.PinType) -> [Cursor] {
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
    
    func first() -> Cursor {
        if nextCursors.count > 0 {
            return self.nextCursors[0]
        }
        
        return .empty
    }
    
}
