//
//  UnionSolution.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04.11.2019.
//

import iGeometry

public struct UnionSolution {
    
    public enum Nature {
        case notOverlap
        case overlap
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

public struct SubtractSolution {
    
    public enum Nature {
        case notOverlap
        case overlap
        case empty
        case hole
    }

    public let pathList: PlainShape
    public let nature: Nature

    init(pathList: PlainShape, nature: Nature) {
        self.pathList = pathList
        self.nature = nature
    }
}

public struct CutSolution {

    public let restPathList: PlainShape
    public let bitePathList: PlainShape
    public let nature: SubtractSolution.Nature

    init(restPathList: PlainShape, bitePathList: PlainShape, nature: SubtractSolution.Nature) {
        self.restPathList = restPathList
        self.bitePathList = bitePathList
        self.nature = nature
    }
}
