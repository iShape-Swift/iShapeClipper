//
//  PathMileStone.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

struct PathMileStone: Equatable {
    
    static let zero = PathMileStone(index: 0, offset: 0)

    let index: Int
    let offset: Int64

    init(index: Int, offset: Int64 = 0) {
        self.index = index
        self.offset = offset
    }

    static func compare(a: PathMileStone, b: PathMileStone) -> Bool {
        if a.index != b.index {
            return a.index > b.index
        }

        return a.offset > b.offset
    }

    static func moreOrEqual(a: PathMileStone, b: PathMileStone) -> Bool {
        if a.index != b.index {
            return a.index > b.index
        }

        return a.offset >= b.offset
    }
    
    public static func == (lhs: PathMileStone, rhs: PathMileStone) -> Bool {
        return lhs.index == rhs.index && lhs.offset == rhs.offset
    }
    
}
