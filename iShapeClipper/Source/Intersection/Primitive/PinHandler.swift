//
//  PinHandler.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

struct PinHandler: Equatable {
    
    static let empty = PinHandler(pinPoint: .empty, index: 0)
    
    var masterSortFactor: PathMileStone

    let isPinPath: Bool
    let index: Int                      // index in outside array
    let type: PinPoint.PinType          // PinType

    var marker: Int                     // 0 - present, 1 - removed

    init(sortFactor: PathMileStone, index: Int, isPinPath: Bool, type: PinPoint.PinType) {
        self.index = index
        self.isPinPath = isPinPath
        self.masterSortFactor = sortFactor
        self.type = type
        self.marker = 0
    }


    init(sortFactor: PathMileStone, index: Int, isPinPath: Bool, marker: Int, type: PinPoint.PinType) {
        self.index = index
        self.isPinPath = isPinPath
        self.masterSortFactor = sortFactor
        self.marker = marker
        self.type = type
    }

    init(pinPoint: PinPoint, index: Int) {
        self.index = index
        self.isPinPath = false
        self.type = pinPoint.type
        self.masterSortFactor = pinPoint.masterMileStone
        self.marker = 0
    }

    public static func == (lhs: PinHandler, rhs: PinHandler) -> Bool {
        return lhs.masterSortFactor.index == rhs.masterSortFactor.index && lhs.masterSortFactor.offset == rhs.masterSortFactor.offset
    }
}
