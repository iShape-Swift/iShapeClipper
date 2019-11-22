//
//  AdjacencyMatrix.swift
//  iGeometry
//
//  Created by Nail Sharipov on 04/10/2019.
//

struct AdjacencyMatrix {

    private(set) var masterIndices: [Int]
    private(set) var slaveIndices: [Int]

    init(size: Int = 0) {
        self.masterIndices = [Int]()
        self.slaveIndices = [Int]()
        self.masterIndices.reserveCapacity(size)
        self.slaveIndices.reserveCapacity(size)
    }
    
    mutating func addMate(master: Int, slave: Int) {
        self.slaveIndices.append(slave)
        self.masterIndices.append(master)
    }
}


