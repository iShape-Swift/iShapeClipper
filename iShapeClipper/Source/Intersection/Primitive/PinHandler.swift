//
//  PinHandler.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

struct PinHandler: Equatable {
    
    var masterSortFactor: PathMileStone

    let isPinPath: Int  // 0 - false, 1 - true
    let index: Int      // index in outside array
    let type: Int       // PinType

    var marker: Int     // 0 - present, 1 - removed

    init(sortFactor: PathMileStone, index: Int, isPinPath: Int, type: Int) {
        self.index = index
        self.isPinPath = isPinPath
        self.masterSortFactor = sortFactor
        self.type = type
        self.marker = 0
    }


    init(sortFactor: PathMileStone, index: Int, isPinPath: Int, marker: Int, type: Int) {
        self.index = index
        self.isPinPath = isPinPath
        self.masterSortFactor = sortFactor
        self.marker = marker
        self.type = type
    }

    init(pinPoint: PinPoint, index: Int) {
        self.index = index
        self.isPinPath = 0
        self.type = pinPoint.type
        self.masterSortFactor = pinPoint.masterMileStone
        self.marker = 0
    }

    public static func == (lhs: PinHandler, rhs: PinHandler) -> Bool {
        return lhs.masterSortFactor.index == rhs.masterSortFactor.index && lhs.masterSortFactor.offset == rhs.masterSortFactor.offset
    }
}
