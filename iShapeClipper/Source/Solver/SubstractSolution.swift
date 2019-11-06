//
//  SubstractSolution.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

public struct SubstractSolution {
    
    public enum Nature {
        case notOverlap
        case overlap
        case empty
        case hole
    }

    public let pathList: PlainPathList
    public let nature: Nature

    init(pathList: PlainPathList, disposition: Nature) {
        self.pathList = pathList
        self.nature = disposition
    }
}
