//
//  SubstractSolution.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

import iGeometry

public struct SubstractSolution {
    
    public enum Disposition {
        case notOverlap
        case overlap
        case same
        case hole
    }

    public let pathList: PlainPathList
    public let disposition: Disposition

    init(pathList: PlainPathList, disposition: Disposition) {
        self.pathList = pathList
        self.disposition = disposition
    }
}
