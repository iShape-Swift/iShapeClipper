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
            Point(x: 5.0, y: -10.0),
            Point(x: 5.0, y: -15.0),
            Point(x: -5.0, y: -15.0),
            Point(x: -5.0, y: -10.0),
            Point(x: -10.0, y: -10.0),
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0)
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
            Point(x: -5.0, y: 10.0),
            Point(x: -5.0, y: 15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -5.0, y: -15.0),
            Point(x: -5.0, y: -10.0),
            Point(x: -10.0, y: -10.0),
            Point(x: -10.0, y: 10.0)
        ]
        
        XCTAssertEqual(path, sample)
    }
    
}
