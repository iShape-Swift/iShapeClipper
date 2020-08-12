//
//  UnionSolution.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04.11.2019.
//

import iGeometry

public struct Solution {
    
    public enum Nature {
        case notOverlap
        case overlap
        case equal
        case masterIncludeSlave
        case slaveIncludeMaster
    }

    public let pathList: PlainShape
    public let nature: Nature

    init(pathList: PlainShape, nature: Nature) {
        self.pathList = pathList
        self.nature = nature
    }
}

public struct DualSolution {

    public let mainPathList: PlainShape
    public let partPathList: PlainShape
    public let nature: Solution.Nature

    init(mainPathList: PlainShape, partPathList: PlainShape, nature: Solution.Nature) {
        self.mainPathList = mainPathList
        self.partPathList = partPathList
        self.nature = nature
    }
}
