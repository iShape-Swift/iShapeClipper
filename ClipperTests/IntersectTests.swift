//
//  IntersectTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 19.11.2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper

final class IntersectTests: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func test_0() {
        let data = SubtractTestData.data[0]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5.0, y: -10.0),
            Point(x: 5.0, y: 0.0),
            Point(x: -5.0, y: 0.0),
            Point(x: -5.0, y: -10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_1() {
        let data = SubtractTestData.data[1]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5.0, y: 10.0),
            Point(x: -5.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_2() {
        let data = SubtractTestData.data[2]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5, y: 10),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }

    
    func test_3() {
        let data = SubtractTestData.data[3]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5, y: 10),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_4() {
        let data = SubtractTestData.data[4]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10, y: 10),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_5() {
        let data = SubtractTestData.data[5]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10, y: 0),
            Point(x: 0, y: -10),
            Point(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }

    
    func test_6() {
        let data = SubtractTestData.data[6]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5, y: 10),
            Point(x: -10, y: 2.5),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -10, y: -2.5),
            Point(x: 5, y: -10),
            Point(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_7() {
        let data = SubtractTestData.data[7]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 0, y: -10),
            Point(x: 0, y: 0),
            Point(x: -10, y: 0),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -10, y: -5),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_8() {
        let data = SubtractTestData.data[8]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 0, y: 10),
            Point(x: 0, y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 10, y: 0),
            Point(x: 0, y: 10),
            Point(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    
    func test_9() {
        let data = SubtractTestData.data[9]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 0, y: 10),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5, y: -10),
            Point(x: 0, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_10() {
        let data = SubtractTestData.data[10]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 10, y: 10),
            Point(x: -5, y: 5),
            Point(x: 0, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 0, y: -10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_11() {
        let data = SubtractTestData.data[11]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 10, y: 10),
            Point(x: -10, y: 0),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 0, y: -10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_12() {
        let data = SubtractTestData.data[12]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 10, y: 5),
            Point(x: 0, y: 0),
            Point(x: 10, y: -5),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_13() {
        let data = SubtractTestData.data[13]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .notOverlap)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    
    func test_14() {
        let data = SubtractTestData.data[14]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 4)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -5, y: 10),
            Point(x: -10, y: 5),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 10, y: 5),
            Point(x: 5, y: 10),
            Point(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = iGeom.float(points: solution.pathList.pathes[2])
        let sample2 = [
            Point(x: 5, y: -10),
            Point(x: 10, y: -5),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path2, sample2)

        let path3 = iGeom.float(points: solution.pathList.pathes[3])
        let sample3 = [
            Point(x: -10, y: -5),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10)
        ]
        
        XCTAssertEqual(path3, sample3)
    }
    
    func test_15() {
        let data = SubtractTestData.data[15]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)

        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0.0, y: 10.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 5.0, y: 0.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0),
            Point(x: -10.0, y: 10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_16() {
        let data = SubtractTestData.data[16]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .notOverlap)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    // spiral
    func test_17() {
        let data = SubtractTestData.data[17]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 3)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -5, y: 10),
            Point(x: -5, y: 5),
            Point(x: -7.5, y: 5),
            Point(x: -7.5, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5, y: 10),
            Point(x: 5, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 10)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = iGeom.float(points: solution.pathList.pathes[2])
        let sample2 = [
            Point(x: 10, y: 5),
            Point(x: 10, y: 10),
            Point(x: 12.5, y: 10),
            Point(x: 12.5, y: 5)
        ]
        
        XCTAssertEqual(path2, sample2)
    }
    
    
    func test_18() {
        let data = SubtractTestData.data[18]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -5, y: 2.5),
            Point(x: -5, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: 2.5),
            Point(x: 5, y: 2.5),
            Point(x: 5, y: -2.5),
            Point(x: -7.5, y: -2.5),
            Point(x: -7.5, y: 2.5)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 10, y: -2.5),
            Point(x: 10, y: 2.5),
            Point(x: 12.5, y: 2.5),
            Point(x: 12.5, y: -2.5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_19() {
        let data = SubtractTestData.data[19]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 10, y: 0),
            Point(x: 0, y: 5),
            Point(x: 0, y: -5),
            Point(x: 10, y: 0),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_20() {
        let data = SubtractTestData.data[20]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 10, y: 10),
            Point(x: 0, y: 5),
            Point(x: 5, y: 0),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_21() {
        let data = SubtractTestData.data[21]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 10, y: 5),
            Point(x: 0, y: 5),
            Point(x: 10, y: 0),
            Point(x: 10, y: -5),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_22() {
        let data = SubtractTestData.data[22]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0, y: -5),
            Point(x: 0, y: 0),
            Point(x: 5, y: 0),
            Point(x: 5, y: -5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_23() {
        let data = SubtractTestData.data[23]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: -5),
            Point(x: 5, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 10),
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
        let data = SubtractTestData.data[24]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 15, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: 15),
            Point(x: 15, y: 15)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5, y: -5),
            Point(x: 15, y: -5),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_25() {
        let data = SubtractTestData.data[25]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 15, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: 15),
            Point(x: 15, y: 15)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5, y: -5),
            Point(x: 15, y: -2.5),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_26() {
        let data = SubtractTestData.data[26]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 15, y: 5),
            Point(x: 5, y: 15),
            Point(x: 15, y: 15)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5, y: -5),
            Point(x: 5, y: -10),
            Point(x: 15, y: -10),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_27() {
        let data = SubtractTestData.data[27]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10, y: -5),
            Point(x: -10, y: -10),
            Point(x: 5, y: -5),
            Point(x: 10, y: 0),
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
        let data = SubtractTestData.data[28]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -10, y: 0),
            Point(x: -5, y: 0),
            Point(x: -5, y: -5),
            Point(x: -10, y: -5)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -10, y: 10),
            Point(x: -5, y: 10),
            Point(x: -5, y: 5),
            Point(x: -10, y: 5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_29() {
        let data = SubtractTestData.data[29]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        
        XCTAssertEqual(path.count, 5)
    }
    
    
    func test_30() {
        let data = SubtractTestData.data[30]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: 10),
            Point(x: 0, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_31() {
        let data = SubtractTestData.data[31]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: 15),
            Point(x: 5, y: 15),
            Point(x: 5, y: -5),
            Point(x: -10, y: -5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_32() {
        let data = SubtractTestData.data[32]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: 15),
            Point(x: 5, y: 15),
            Point(x: 5, y: -5),
            Point(x: -10, y: -5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_33() {
        let data = SubtractTestData.data[33]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -15, y: 20),
            Point(x: -15, y: -10),
            Point(x: 7, y: -10),
            Point(x: 7, y: -15),
            Point(x: -20, y: -15),
            Point(x: -20, y: 20)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5, y: 20),
            Point(x: 5, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: 20)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_34() {
        let data = SubtractTestData.data[34]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        XCTAssertEqual(path0.count, 6)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        XCTAssertEqual(path1.count, 9)
    }
    
    
    func test_35() {
        let data = SubtractTestData.data[35]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -4, y: -10),
            Point(x: 10, y: -10),
            Point(x: -10, y: -14),
            Point(x: -16.8, y: -14)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 10, y: -10),
            Point(x: 10, y: -5.625),
            Point(x: 12, y: -5),
            Point(x: 15, y: -9)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_36() {
        let data = SubtractTestData.data[36]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: 10),
            Point(x: 5, y: 10)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -5, y: 10),
            Point(x: -5, y: 5),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_37() {
        let data = SubtractTestData.data[37]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: 4),
            Point(x: 2, y: 6),
            Point(x: 0, y: 8),
            Point(x: 0, y: 10),
            Point(x: 5, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
        
    }
    
    func test_38() {
        let data = SubtractTestData.data[38]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 5)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5, y: 0),
            Point(x: 5, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 10, y: 0),
            Point(x: 10, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -5),
            Point(x: 10, y: -5)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = iGeom.float(points: solution.pathList.pathes[2])
        let sample2 = [
            Point(x: 0, y: 10),
            Point(x: 0, y: 15),
            Point(x: 5, y: 15),
            Point(x: 5, y: 10)
        ]
        
        XCTAssertEqual(path2, sample2)
        
        let path3 = iGeom.float(points: solution.pathList.pathes[3])
        let sample3 = [
            Point(x: -10, y: 10),
            Point(x: -10, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: 10)
        ]
        
        XCTAssertEqual(path3, sample3)
        
        let path4 = iGeom.float(points: solution.pathList.pathes[4])
        let sample4 = [
            Point(x: -15, y: -10),
            Point(x: 10, y: -10),
            Point(x: 15, y: -10),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15)
        ]
        
        XCTAssertEqual(path4, sample4)
    }
    
    
    func test_39() {
        let data = SubtractTestData.data[39]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 15, y: 15),
            Point(x: 5, y: 10),
            Point(x: 5, y: 15)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -15, y: -10),
            Point(x: 15, y: -10),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    func test_40() {
        let data = SubtractTestData.data[40]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave, iGeom: iGeom)

        XCTAssertEqual(solution.nature, .empty)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
}
