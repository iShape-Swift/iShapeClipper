//
//  Cursor.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

struct Cursor: Equatable {

    static let empty = Cursor(type: .null, index: -1)

    let type: PinPoint.PinType
    let index: Int

    var isNotEmpty: Bool { index >= 0 }
    var isEmpty: Bool { index < 0 }

    static func == (lhs: Cursor, rhs: Cursor) -> Bool {
        return lhs.type == rhs.type && lhs.index == rhs.index
    }
}
