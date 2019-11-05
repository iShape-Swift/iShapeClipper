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
