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
    }

    public let pathList: PlainPathList
    public let nature: Nature

    init(pathList: PlainPathList, nature: Nature) {
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

    public let pathList: PlainPathList
    public let nature: Nature

    init(pathList: PlainPathList, nature: Nature) {
        self.pathList = pathList
        self.nature = nature
    }
}

public struct CutSolution {

    public let restPathList: PlainPathList
    public let bitePathList: PlainPathList
    public let nature: SubtractSolution.Nature

    init(restPathList: PlainPathList, bitePathList: PlainPathList, nature: SubtractSolution.Nature) {
        self.restPathList = restPathList
        self.bitePathList = bitePathList
        self.nature = nature
    }
}
