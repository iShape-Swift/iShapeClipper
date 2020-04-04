//
//  PolygonPointTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 03.04.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper

final class PolygonPointTests: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    /*
    func test_00() {
        let data = PolygonPoint.data[0]
        
        let master = iGeom.int(points: data[0])
        let slave = iGeom.int(points: data[1])
        
        let solution = Solver.subtract(master: master, slave: slave, iGeom: iGeom)
        
        XCTAssertEqual(solution.nature, .overlap)
        XCTAssertEqual(solution.pathList.layouts.count, 1)
        
        let path = iGeom.float(points: solution.pathList.pathes[0])
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
    */
    
}
