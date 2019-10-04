//
//  PinPath.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

struct PinPath {
    
    static let empty = PinPath(v0: .empty, v1: .empty, type: 0)
    
    let v0: PinPoint
    let v1: PinPoint

    init(v0: PinPoint, v1: PinPoint, type: Int) {
        self.v0 = PinPoint(pin: v0, type: type)
        self.v1 = PinPoint(pin: v1, type: type)
    }

    private func getLength(count: Int) -> Int {
        let a = v0.masterMileStone
        let b = v1.masterMileStone
        var length = 0
        if PathMileStone.compare(a: a, b: b) {
            length = count
        }

        length += b.index - a.index
        if b.offset != 0 {
            length += 1
        }

        return length;
    }


    func extract(index: Int, pathCount: Int) -> [PinHandler] {
        let n = pathCount

        let firstHandler = PinHandler(sortFactor: v0.masterMileStone, index: index, isPinPath: 1, marker: 0, type: v0.type)
        let lastHandler = PinHandler(sortFactor: v1.masterMileStone, index: index, isPinPath: 1, marker: 1, type: v0.type)

        let length = getLength(count: n)

        if length < 2 {
            return [firstHandler, lastHandler]
        }

        if length == 2 {
            let middleIndex = (v0.masterMileStone.index + 1) % n;
            let middleSortFactor = PathMileStone(index: middleIndex, offset: 0)
            let middle = PinHandler(sortFactor: middleSortFactor, index: index, isPinPath: 1, marker: 1, type: v0.type)
            return [firstHandler, middle, lastHandler]
        }


        var handlers = [PinHandler].init(repeating: .init(pinPoint: .init(point: .zero, type: 0, masterMileStone: .zero, slaveMileStone: .zero), index: 0), count: length + 1)
        var j = 0
        handlers[j] = firstHandler
        j += 1

        var i = (v0.masterMileStone.index + 1) % n
        let endIndex: Int
        if v1.masterMileStone.offset != 0 {
            endIndex = v1.masterMileStone.index
        } else {
            endIndex = (v1.masterMileStone.index - 1 + n) % n
        }

        while i != endIndex {
            handlers[j] = PinHandler(sortFactor: PathMileStone(index: i), index: index, isPinPath: 1, marker: 1, type: v0.type)
            j += 1
            i = (i + 1) % n
        }

        handlers[j] = PinHandler(sortFactor: PathMileStone(index: endIndex), index: index, isPinPath: 1, marker: 1, type: v0.type)
        j += 1
        handlers[j] = lastHandler
        j += 1

        return handlers
    }
}
