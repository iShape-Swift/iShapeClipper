//
//  UnionTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 05.11.2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper


final class UnionTests: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func test_0() {
        let data = UnionTestData.data[0]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: -10),
            Point(x: 5, y: -15),
            Point(x: -5, y: -15),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_1() {
        let data = UnionTestData.data[1]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5, y: 10),
            Point(x: -5, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -5, y: -15),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_2() {
        let data = UnionTestData.data[2]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5, y: 10),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -5, y: -15),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_3() {
        let data = UnionTestData.data[3]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5, y: 10),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_4() {
        let data = UnionTestData.data[4]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10, y: 10),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_5() {
        let data = UnionTestData.data[5]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10, y: 0),
            Point(x: -20, y: 10),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: 0, y: -10),
            Point(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_6() {
        let data = UnionTestData.data[6]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: 10),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: 5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: -2.5),
            Point(x: -15, y: 0),
            Point(x: -10, y: 2.5),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_7() {
        let data = UnionTestData.data[7]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0, y: -10),
            Point(x: 0, y: -15),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: -5),
            Point(x: -15, y: 0),
            Point(x: -10, y: 0),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_8() {
        let data = UnionTestData.data[8]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    func test_9() {
        let data = UnionTestData.data[9]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    func test_10() {
        let data = UnionTestData.data[10]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    func test_11() {
        let data = UnionTestData.data[11]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0, y: -10),
            Point(x: -30, y: -10),
            Point(x: -10, y: 0),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_12() {
        let data = UnionTestData.data[12]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    func test_13() {
        let data = UnionTestData.data[13]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: -10),
            Point(x: 0, y: -15),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_14() {
        let data = UnionTestData.data[14]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    func test_15() {
        let data = UnionTestData.data[15]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_16() {
        let data = UnionTestData.data[16]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5, y: 0),
            Point(x: 5, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: 0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -5, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 0),
            Point(x: 0, y: -5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    func test_17() {
        let data = UnionTestData.data[17]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: -5, y: 10),
            Point(x: -5, y: 15),
            Point(x: -10, y: 15),
            Point(x: -10, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 0),
            Point(x: -5, y: 0),
            Point(x: -5, y: 5),
            Point(x: -7.5, y: 5),
            Point(x: -7.5, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: 5, y: 10),
            Point(x: 5, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 20),
            Point(x: 20, y: 20),
            Point(x: 20, y: -20),
            Point(x: -25, y: -20),
            Point(x: -25, y: 30),
            Point(x: 10, y: 30),
            Point(x: 10, y: 10),
            Point(x: 12.5, y: 10),
            Point(x: 12.5, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: 20),
            Point(x: 0, y: 20),
            Point(x: 0, y: 10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    func test_18() {
        let data = UnionTestData.data[18]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: -5, y: 2.5),
            Point(x: -5, y: 15),
            Point(x: -10, y: 15),
            Point(x: -10, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: -2.5),
            Point(x: -7.5, y: -2.5),
            Point(x: -7.5, y: 2.5)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: 5, y: 2.5),
            Point(x: 5, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 20),
            Point(x: 20, y: 20),
            Point(x: 20, y: -20),
            Point(x: -25, y: -20),
            Point(x: -25, y: 30),
            Point(x: 10, y: 30),
            Point(x: 10, y: 2.5),
            Point(x: 12.5, y: 2.5),
            Point(x: 12.5, y: -2.5),
            Point(x: 10, y: -2.5),
            Point(x: 10, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: 20),
            Point(x: 0, y: 20),
            Point(x: 0, y: 2.5)
        ]

        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_19() {
        let data = UnionTestData.data[19]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    
    func test_20() {
        let data = UnionTestData.data[20]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    
    func test_21() {
        let data = UnionTestData.data[21]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 10, y: 5),
            Point(x: 15, y: 5),
            Point(x: 10, y: -5),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_22() {
        let data = UnionTestData.data[22]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: 0, y: -5),
            Point(x: 0, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: 5, y: -10),
            Point(x: 5, y: -5)

        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: 5, y: 0),
            Point(x: 5, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 0)
        ]
        
        
        XCTAssertEqual(path1, sample1)
    }
    
    func test_23() {
        let data = UnionTestData.data[23]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: -5),
            Point(x: 5, y: 5),
            Point(x: -10, y: 5),
            Point(x: -10, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_24() {
        let data = UnionTestData.data[24]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: -5),
            Point(x: -5, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_25() {
        let data = UnionTestData.data[25]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 15, y: 5),
            Point(x: 25, y: 0),
            Point(x: 15, y: -2.5),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5),
            Point(x: 5, y: -5),
            Point(x: -5, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: 15),
            Point(x: 15, y: 15)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_26() {
        let data = UnionTestData.data[26]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    func test_27() {
        let data = UnionTestData.data[27]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10, y: -5),
            Point(x: -10, y: 0),
            Point(x: 5, y: 0),
            Point(x: 5, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_28() {
        let data = UnionTestData.data[28]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: -10, y: 0),
            Point(x: -15, y: 0),
            Point(x: -15, y: -10),
            Point(x: 5, y: -10),
            Point(x: 5, y: 10),
            Point(x: -5, y: 10),
            Point(x: -5, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 0),
            Point(x: -5, y: 0),
            Point(x: -5, y: -5),
            Point(x: -10, y: -5)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: -10, y: 10),
            Point(x: -20, y: 10),
            Point(x: -20, y: 20),
            Point(x: 10, y: 20),
            Point(x: 10, y: -15),
            Point(x: -20, y: -15),
            Point(x: -20, y: 5),
            Point(x: -10, y: 5)
        ]

        XCTAssertEqual(path1, sample1)
    }
    
    func test_29() {
        let data = UnionTestData.data[29]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: -15, y: 10),
            Point(x: -20, y: 10),
            Point(x: -20, y: 20),
            Point(x: 10, y: 20),
            Point(x: 10, y: -15),
            Point(x: -20, y: -15),
            Point(x: -20, y: 5),
            Point(x: -16.296299, y: 5)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: -11.6189995, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 0),
            Point(x: -15, y: 0),
            Point(x: -15, y: -10),
            Point(x: 5, y: -10),
            Point(x: 5, y: 10),
            Point(x: -8.125, y: 10),
            Point(x: -10, y: 7)
        ]

        XCTAssertEqual(path1, sample1)
    }
    
    func test_30() {
        let data = UnionTestData.data[30]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: 0, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: 0),
            Point(x: -10, y: 0),
            Point(x: -10, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 10),
            Point(x: 0, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: -5, y: 10),
            Point(x: -15, y: 10),
            Point(x: -15, y: 20),
            Point(x: 15, y: 20),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: 5),
            Point(x: -5, y: 5)
        ]

        XCTAssertEqual(path1, sample1)
    }
    
    func test_31() {
        let data = UnionTestData.data[31]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: 15),
            Point(x: 5, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 20),
            Point(x: 20, y: 20),
            Point(x: 20, y: -20),
            Point(x: -25, y: -20),
            Point(x: -25, y: 30),
            Point(x: 10, y: 30),
            Point(x: 10, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: 20),
            Point(x: 0, y: 20),
            Point(x: 0, y: 15)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_32() {
        let data = UnionTestData.data[32]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: 15),
            Point(x: 5, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 20),
            Point(x: 20, y: 20),
            Point(x: 20, y: -20),
            Point(x: -25, y: -20),
            Point(x: -25, y: 30),
            Point(x: 10, y: 30),
            Point(x: 10, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: 20),
            Point(x: 0, y: 20),
            Point(x: 0, y: 15)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_33() {
        let data = UnionTestData.data[33]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: 5, y: 20),
            Point(x: 5, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: 20)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: 7, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 20),
            Point(x: 20, y: 20),
            Point(x: 20, y: -20),
            Point(x: -25, y: -20),
            Point(x: -25, y: 30),
            Point(x: 10, y: 30),
            Point(x: 10, y: -10),
            Point(x: 7, y: -10)
        ]

        XCTAssertEqual(path1, sample1)
    }
    
    func test_34() {
        let data = UnionTestData.data[34]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 3)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        let path2 = iGeom.float(points: pathes[2])
        
        let sample0 = [
            Point(x: 5, y: 20),
            Point(x: 5, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: 20)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: 4.9167, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: -4)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let sample2 = [
            Point(x: 4.0833, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 20),
            Point(x: 20, y: 20),
            Point(x: 20, y: -20),
            Point(x: -25, y: -20),
            Point(x: -25, y: 30),
            Point(x: 10, y: 30),
            Point(x: 10, y: -10),
            Point(x: 4.5, y: -10)
        ]
       
        XCTAssertEqual(path2, sample2)
    }
    
    func test_35() {
        let data = UnionTestData.data[35]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 3)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        let path2 = iGeom.float(points: pathes[2])
        
        let sample0 = [
            Point(x: -4, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: 20),
            Point(x: 0, y: 20),
            Point(x: 0, y: 0),
            Point(x: -5, y: 0),
            Point(x: -5, y: 15),
            Point(x: -10, y: 15),
            Point(x: -10, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: -14),
            Point(x: -16.8, y: -14)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: -10, y: -14),
            Point(x: 15, y: -14),
            Point(x: 15, y: -9)
        ]

        XCTAssertEqual(path1, sample1)
        
        let sample2 = [
            Point(x: 15.0, y: -9.0),
            Point(x: 15.0, y: 20.0),
            Point(x: 20.0, y: 20.0),
            Point(x: 20.0, y: -20.0),
            Point(x: -25.0, y: -20.0),
            Point(x: -25.0, y: 30.0),
            Point(x: 10.0, y: 30.0),
            Point(x: 10.0, y: -5.625),
            Point(x: 12.0, y: -5.0)
        ]

        XCTAssertEqual(path2, sample2)
    }
    
    func test_36() {
        let data = UnionTestData.data[36]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -10),
            Point(x: -5, y: -10),
            Point(x: -5, y: 5),
            Point(x: -10, y: 10),
            Point(x: -5, y: 10),
            Point(x: -5, y: 15),
            Point(x: 0, y: 15),
            Point(x: 0, y: 10),
            Point(x: 5, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_37() {
        let data = UnionTestData.data[37]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: 5, y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -10),
            Point(x: -5, y: -10),
            Point(x: -5, y: 15),
            Point(x: 0, y: 15),
            Point(x: 0, y: 10),
            Point(x: 5, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: 0, y: 8),
            Point(x: 0, y: 4),
            Point(x: 2, y: 6)
        ]

        XCTAssertEqual(path1, sample1)
    }
    
    func test_38() {
        let data = UnionTestData.data[38]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 5)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        let path2 = iGeom.float(points: pathes[2])
        let path3 = iGeom.float(points: pathes[3])
        let path4 = iGeom.float(points: pathes[4])
        
        let sample0 = [
            Point(x: 5, y: 0),
            Point(x: 5, y: 10),
            Point(x: 0, y: 10),
            Point(x: 0, y: 0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: -10, y: 10),
            Point(x: -10, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 0),
            Point(x: -5, y: 10)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let sample2 = [
            Point(x: -15, y: -10),
            Point(x: -15, y: 20),
            Point(x: 0, y: 20),
            Point(x: 0, y: 15),
            Point(x: 5, y: 15),
            Point(x: 5, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: -15),
            Point(x: -15, y: -15)
        ]
        
        XCTAssertEqual(path2, sample2)
        
        let sample3 = [
            Point(x: 10, y: -5),
            Point(x: 10, y: -10),
            Point(x: 15, y: -10),
            Point(x: 15, y: -5)
        ]
        
        XCTAssertEqual(path3, sample3)
        
        let sample4 = [
            Point(x: 15, y: 15),
            Point(x: 15, y: 20),
            Point(x: 20, y: 20),
            Point(x: 20, y: -20),
            Point(x: -25, y: -20),
            Point(x: -25, y: 30),
            Point(x: 10, y: 30),
            Point(x: 10, y: 15)
        ]

        XCTAssertEqual(path4, sample4)
    }
    
    func test_39() {
        let data = UnionTestData.data[39]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: 5, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: 10),
            Point(x: 15, y: 10),
            Point(x: 15, y: -10),
            Point(x: 5, y: -10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: -5, y: 0),
            Point(x: 5, y: 0),
            Point(x: 5, y: 5),
            Point(x: -5, y: 5)
        ]

        XCTAssertEqual(path1, sample1)
    }
    
    func test_40() {
        let data = UnionTestData.data[40]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: 10),
            Point(x: 15, y: 10),
            Point(x: 15, y: -10),
            Point(x: 5, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_41() {
        let data = UnionTestData.data[41]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    func test_42() {
        let data = UnionTestData.data[42]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .slaveIncludeMaster)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    func test_43() {
        let data = UnionTestData.data[43]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let pathes = solution.pathList.pathes
        
        let path0 = iGeom.float(points: pathes[0])
        let path1 = iGeom.float(points: pathes[1])
        
        let sample0 = [
            Point(x: 5.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: -15.0, y: 5.0),
            Point(x: 5.0, y: 5.0),
            Point(x: 5.0, y: 0.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 15.0, y: 10.0),
            Point(x: 15.0, y: 0.0),
            Point(x: 20.0, y: 0.0),
            Point(x: 20.0, y: -20.0),
            Point(x: 5.0, y: -20.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let sample1 = [
            Point(x: 5.0, y: 0.0),
            Point(x: -10.0, y: 0.0),
            Point(x: -10.0, y: -10.0),
            Point(x: 5.0, y: -10.0)
        ]

        XCTAssertEqual(path1, sample1)
    }
    
    func test_44() {
        let data = UnionTestData.data[44]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let pathes = solution.pathList.pathes
        
        let path = iGeom.float(points: pathes[0])
        
        let sample = [
            Point(x: 5.0, y: -9.848499),
            Point(x: 5.0, y: -15.0),
            Point(x: -5.0, y: -15.0),
            Point(x: -5.0, y: -9.5455),
            Point(x: -6.5, y: -9.5),
            Point(x: -3.3332999, y: 0.0),
            Point(x: -10.0, y: 0.0),
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0)
        ]
        
        XCTAssertEqual(path, sample)

    }
    
    func test_45() {
        let data = UnionTestData.data[45]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .slaveIncludeMaster)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let pathes = solution.pathList.pathes
        
        let path = iGeom.float(points: pathes[0])
        
        let sample = [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ]
        
        XCTAssertEqual(path, sample)

    }
    
    func test_46() {
        let data = UnionTestData.data[46]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.union(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .slaveIncludeMaster)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let pathes = solution.pathList.pathes
        
        let path = iGeom.float(points: pathes[0])
        
        let sample = [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ]
        
        XCTAssertEqual(path, sample)

    }
}
