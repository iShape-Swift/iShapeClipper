//
//  SubtractTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 04/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper


public class SubtractTest: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func test_0() {
        let data = SubstractTests.data(index: 0)
        
        let master = iGeom.int(points: data.master)
        let slave = iGeom.int(points: data.slave)
        
        let solution = Subtractor.substract(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.shapes.count, 1)
        
        let path = iGeom.float(points: solution.shapes[0].points)
        let sample = [
            Point(x: 5, y: -10),
            Point(x: 5, y: 0),
            Point(x: -5, y: 0),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    func test_1() {
        let data = SubstractTests.data(index: 1)
        let master = iGeom.int(points: data.master)
        let slave = iGeom.int(points: data.slave)
        
        
        let solution = Subtractor.substract(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.shapes.count, 1)
        
        let path = iGeom.float(points: solution.shapes[0].points)
        let sample = [
            Point(x: -5, y: 10),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
    
    func test_2() {
        let data = SubstractTests.data(index: 2)
        let master = iGeom.int(points: data.master)
        let slave = iGeom.int(points: data.slave)
        
        
        let solution = Subtractor.substract(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.disposition, .hasIntersections)
        XCTAssertEqual(solution.shapes.count, 1)
        
        let path = iGeom.float(points: solution.shapes[0].points)
        let sample = [
            Point(x: -5, y: 10),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
        ]
        
        XCTAssertEqual(path, sample)
    }
}
