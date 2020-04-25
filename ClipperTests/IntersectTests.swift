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
    
    func test_00() {
        let data = SubtractTestData.data[0]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.intersect(master: master, slave: slave)
        
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
    
    func test_01() {
        let data = SubtractTestData.data[1]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
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
    
    
    func test_02() {
        let data = SubtractTestData.data[2]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.intersect(master: master, slave: slave)
        
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

    
    func test_03() {
        let data = SubtractTestData.data[3]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
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
    
    
    func test_04() {
        let data = SubtractTestData.data[4]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10.0, y: 10.0),
            Point(x: -5.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_05() {
        let data = SubtractTestData.data[5]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -10.0, y: 0.0),
            Point(x: 0.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: -10.0, y: 10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }

    
    func test_06() {
        let data = SubtractTestData.data[6]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5.0, y: 10.0),
            Point(x: -10.0, y: 2.5),
            Point(x: -10.0, y: -2.5),
            Point(x: 5.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_07() {
        let data = SubtractTestData.data[7]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0.0, y: -10.0),
            Point(x: 0.0, y: 0.0),
            Point(x: -10.0, y: 0.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -5.0, y: -10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_08() {
        let data = SubtractTestData.data[8]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    
    
    func test_09() {
        let data = SubtractTestData.data[9]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5.0, y: -10.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 0.0, y: 10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_10() {
        let data = SubtractTestData.data[10]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    
    func test_11() {
        let data = SubtractTestData.data[11]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 20.0, y: 10.0),
            Point(x: 0.0, y: 0.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_12() {
        let data = SubtractTestData.data[12]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0.0, y: 0.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 5.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_13() {
        let data = SubtractTestData.data[13]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .notOverlap)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    
    func test_14() {
        let data = SubtractTestData.data[14]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5.0, y: 10.0),
            Point(x: -10.0, y: 5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -5.0, y: -10.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 5.0),
            Point(x: 5.0, y: 10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_15() {
        let data = SubtractTestData.data[15]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)

        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 5.0, y: 0.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_16() {
        let data = SubtractTestData.data[16]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .notOverlap)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    // spiral
    func test_17() {
        let data = SubtractTestData.data[17]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -5.0, y: 10.0),
            Point(x: -5.0, y: 5.0),
            Point(x: 0.0, y: 5.0),
            Point(x: 0.0, y: 10.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5.0, y: 10.0),
            Point(x: 5.0, y: 5.0),
            Point(x: 10.0, y: 5.0),
            Point(x: 10.0, y: 10.0)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_18() {
        let data = SubtractTestData.data[18]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -5.0, y: 2.5),
            Point(x: -5.0, y: 0.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 2.5)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5.0, y: 2.5),
            Point(x: 5.0, y: -2.5),
            Point(x: 10.0, y: -2.5),
            Point(x: 10.0, y: 2.5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_19() {
        let data = SubtractTestData.data[19]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    
    func test_20() {
        let data = SubtractTestData.data[20]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .masterIncludeSlave)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    

    func test_21() {
        let data = SubtractTestData.data[21]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 10.0, y: 5.0),
            Point(x: 0.0, y: 5.0),
            Point(x: 10.0, y: 0.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_22() {
        let data = SubtractTestData.data[22]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 0.0, y: -5.0),
            Point(x: 0.0, y: 0.0),
            Point(x: -5.0, y: 0.0),
            Point(x: -5.0, y: -5.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_23() {
        let data = SubtractTestData.data[23]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5.0, y: 5.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 5.0, y: 10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_24() {
        let data = SubtractTestData.data[24]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5.0, y: -5.0),
            Point(x: 15.0, y: -5.0),
            Point(x: 15.0, y: 5.0),
            Point(x: 5.0, y: 5.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_25() {
        let data = SubtractTestData.data[25]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 15.0, y: 5.0),
            Point(x: 5.0, y: 5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 15.0, y: -2.5)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_26() {
        let data = SubtractTestData.data[26]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 5.0, y: 15.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 15.0, y: -10.0),
            Point(x: 15.0, y: 5.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_27() {
        let data = SubtractTestData.data[27]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: -10.0),
            Point(x: 5.0, y: -5.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5.0, y: -5.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 5.0, y: 0.0)
        ]
        
        XCTAssertEqual(path1, sample1)

    }
    
    
    func test_28() {
        let data = SubtractTestData.data[28]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -10.0, y: 0.0),
            Point(x: -5.0, y: 0.0),
            Point(x: -5.0, y: 5.0),
            Point(x: -10.0, y: 5.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -10.0, y: 10.0),
            Point(x: -5.0, y: 10.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -10.0, y: 15.0)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_29() {
        let data = SubtractTestData.data[29]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -15.0, y: 10.0),
            Point(x: -8.125, y: 10.0),
            Point(x: -5.0, y: 15.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -11.6189995, y: 5.0),
            Point(x: -16.296299, y: 5.0),
            Point(x: -18.5, y: -3.5)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_30() {
        let data = SubtractTestData.data[30]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 0.0, y: 5.0),
            Point(x: -5.0, y: 5.0),
            Point(x: -5.0, y: 3.0),
            Point(x: 0.0, y: 3.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -5.0, y: 10.0),
            Point(x: 0.0, y: 10.0),
            Point(x: 0.0, y: 15.0),
            Point(x: -5.0, y: 15.0)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_31() {
        let data = SubtractTestData.data[31]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5.0, y: 15.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -11.0, y: -5.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 15.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 15.0)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    func test_32() {
        let data = SubtractTestData.data[32]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 3)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5.0, y: 15.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 15.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 15.0)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = iGeom.float(points: solution.pathList.pathes[2])
        let sample2 = [
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -14.0, y: -4.0)
        ]
        
        XCTAssertEqual(path2, sample2)
    }
    
    func test_33() {
        let data = SubtractTestData.data[33]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 3)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5.0, y: 20.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 7.0, y: -10.0),
            Point(x: 7.0, y: 20.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 7.0, y: -15.0),
            Point(x: -20.0, y: -15.0),
            Point(x: 7.0, y: -16.0)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = iGeom.float(points: solution.pathList.pathes[2])
        let sample2 = [
            Point(x: -20.0, y: -15.0),
            Point(x: -20.0, y: 20.0),
            Point(x: -23.0, y: 20.0)
        ]
        
        XCTAssertEqual(path2, sample2)
    }
    
    
    func test_34() {
        let data = SubtractTestData.data[34]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 4)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5.0, y: 20.0),
            Point(x: 5.0, y: -4.0),
            Point(x: 7.0, y: 20.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 4.9167, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 4.5, y: -10.0)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = iGeom.float(points: solution.pathList.pathes[2])
        let sample2 = [
            Point(x: 4.0833, y: -15.0),
            Point(x: -20.0, y: -15.0),
            Point(x: 4.0, y: -16.0)
        ]
        
        XCTAssertEqual(path2, sample2)
        
        let path3 = iGeom.float(points: solution.pathList.pathes[3])
        let sample3 = [
            Point(x: -20.0, y: -15.0),
            Point(x: -20.0, y: 20.0),
            Point(x: -23.0, y: 20.0)
        ]
        
        XCTAssertEqual(path3, sample3)
    }
    
    
    func test_35() {
        let data = SubtractTestData.data[35]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -4.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: -5.625)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -10.0, y: -14.0),
            Point(x: -16.8, y: -14.0),
            Point(x: -20.0, y: -15.0),
            Point(x: -15.0, y: -15.0)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_36() {
        let data = SubtractTestData.data[36]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5.0, y: 0.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 5.0, y: -5.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: -5.0, y: 10.0),
            Point(x: -5.0, y: 5.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 10.0)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    
    func test_37() {
        let data = SubtractTestData.data[37]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 3)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5.0, y: 0.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 5.0, y: -5.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 0.0, y: 8.0),
            Point(x: 0.0, y: 10.0),
            Point(x: -2.0, y: 10.0)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = iGeom.float(points: solution.pathList.pathes[2])
        let sample2 = [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 4.0),
            Point(x: -2.0, y: 2.0)
        ]
        
        XCTAssertEqual(path2, sample2)
    }
    
    func test_38() {
        let data = SubtractTestData.data[38]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        
        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 4)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: 5.0, y: 0.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 0.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 0.0, y: 10.0),
            Point(x: 0.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 10.0)
        ]
        
        XCTAssertEqual(path1, sample1)
        
        let path2 = iGeom.float(points: solution.pathList.pathes[2])
        let sample2 = [
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -15.0, y: 15.0),
            Point(x: -15.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ]
        
        XCTAssertEqual(path2, sample2)
        
        let path3 = iGeom.float(points: solution.pathList.pathes[3])
        let sample3 = [
            Point(x: 5.0, y: 15.0),
            Point(x: 5.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: 15.0)
        ]
        
        XCTAssertEqual(path3, sample3)
    }
    
    
    func test_39() {
        let data = SubtractTestData.data[39]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 15.0, y: 15.0),
            Point(x: 5.0, y: 10.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -15.0, y: -5.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 15.0, y: -10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_40() {
        let data = SubtractTestData.data[40]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)

        XCTAssertEqual(solution.nature, .equal)
        XCTAssertEqual(solution.pathList.layouts.count, 0)
    }
    
    func test_41() {
        let data = SubtractTestData.data[41]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5.0, y: 5.0),
            Point(x: -5.0, y: -5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 5.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_42() {
        let data = SubtractTestData.data[42]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: -5.0, y: 5.0),
            Point(x: -5.0, y: -5.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 10.0, y: 5.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_43() {
        let data = SubtractTestData.data[43]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 10.0, y: 5.0),
            Point(x: 0.0, y: 5.0),
            Point(x: 10.0, y: 0.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_44() {
        let data = SubtractTestData.data[44]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 2)
        
        let path0 = iGeom.float(points: solution.pathList.pathes[0])
        let sample0 = [
            Point(x: -10.0, y: -5.0),
            Point(x: -5.0, y: -5.0),
            Point(x: -5.0, y: 5.0),
            Point(x: -10.0, y: 5.0)
        ]
        
        XCTAssertEqual(path0, sample0)
        
        let path1 = iGeom.float(points: solution.pathList.pathes[1])
        let sample1 = [
            Point(x: 5.0, y: 5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 5.0)
        ]
        
        XCTAssertEqual(path1, sample1)
    }
    
    func test_45() {
        let data = SubtractTestData.data[45]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
        let sample = [
            Point(x: 1.0, y: -0.0001),
            Point(x: 1.0, y: 0.0),
            Point(x: 0.0, y: 1.0),
            Point(x: -1.0, y: 0.0),
            Point(x: -1.0, y: -0.0001),
            Point(x: 0.0, y: 0.9999)
        ]
        
        XCTAssertEqual(path, sample)
        
    }

    
    func test_46() {
        let data = SubtractTestData.data[46]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .notOverlap)
    }
    
    func test_47() {
        let data = SubtractTestData.data[47]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
    }
    
    func test_48() {
        let data = SubtractTestData.data[48]
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])

        let solution = Solver.intersect(master: master, slave: slave)
        
        XCTAssertEqual(solution.nature, .overlap)
        
        let path = solution.pathList.pathes[0]
        let sample = [
            IntPoint(x: -1160, y: 3300),
            IntPoint(x: -1160, y: 198),
            IntPoint(x: 27, y: -11),
            IntPoint(x: -9, y: 32),
            IntPoint(x: -950, y: 198),
            IntPoint(x: -950, y: 3300)
        ]
        
        XCTAssertEqual(path, sample)
    }
}

