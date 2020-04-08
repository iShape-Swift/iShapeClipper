//
//  CornerTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 05/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper


final class CornerTests: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func test_0() {
        
        let corner = Corner(
            o: iGeom.int(point: Point(x: 0, y: 0)),
            a: iGeom.int(point: Point(x: 0, y: 10)),
            b: iGeom.int(point: Point(x: 10, y: 0))
        )
        
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: 5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: -5))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -5, y: -5))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 0, y: -5))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -5, y: 5))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -5, y: 0))), true)
    }
    
    
    func test_1() {
        let corner = Corner(
            o: iGeom.int(point: Point(x: 0, y: 0)),
            a: iGeom.int(point: Point(x: -10, y: 0)),
            b: iGeom.int(point: Point(x: 10, y: 0))
        )
        
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 0, y: 5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: 5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -5, y: 5))), false)
        
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -5, y: -5))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 0, y: -5))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: -5))), true)
    }
    
    
    func test_2() {
        let corner = Corner(
            o: iGeom.int(point: Point(x: 0, y: 0)),
            a: iGeom.int(point: Point(x: -10, y: -10)),
            b: iGeom.int(point: Point(x: 10, y: -10))
        )
        
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 10, y: 0))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 0, y: 5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: 5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -5, y: 5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -10, y: 0))), false)
        
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 0, y: -10))), true)
    }
    
    
    func test_3() {
        let corner = Corner(
            o: iGeom.int(point: Point(x: 0, y: 0)),
            a: iGeom.int(point: Point(x: -10, y: 0)),
            b: iGeom.int(point: Point(x: 0, y: -10))
        )
        
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -5, y: -5))), true)
        
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: -5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: 0))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: 5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 0, y: 5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -5, y: 5))), false)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: -5, y: 0))), false)
        
    }
    
    
    func test_4() {
        
        let corner = Corner(
            o: iGeom.int(point: Point(x: 10, y: 10)),
            a: iGeom.int(point: Point(x: 10, y: 20)),
            b: iGeom.int(point: Point(x: 20, y: 10))
        )
        
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 15, y: 15))), false)
        
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 15, y: 5))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: 5))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 10, y: 5))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: 15))), true)
        XCTAssertEqual(corner.isBetween(p: iGeom.int(point: Point(x: 5, y: 10))), true)
    }
}
