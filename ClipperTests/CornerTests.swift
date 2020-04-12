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
    
    func test_0() {
        
        let o = Point(x: 0, y: 0).int
        
        let corner = Corner(
            d0: DBPoint(iPoint: o),
            o: o,
            a: Point(x: 0, y: 10).int,
            b: Point(x: 10, y: 0).int
        )
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 0).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 0).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: 5).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: 5).int, clockwise: true), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 0).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 0).int, clockwise: true), .onBoarder)
    }
    
    
    func test_1() {
        let o = Point(x: 0, y: 0).int
        
        let corner = Corner(
            d0: DBPoint(iPoint: o),
            o: o,
            a: Point(x: -10, y: 0).int,
            b: Point(x: 10, y: 0).int
        )
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 0).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 0).int, clockwise: true), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 0).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 0).int, clockwise: true), .onBoarder)
    }
    
    
    func test_2() {
        let o = Point(x: 0, y: 0).int
        
        let corner = Corner(
            d0: DBPoint(iPoint: o),
            o: o,
            a: Point(x: -10, y: -10).int,
            b: Point(x: 10, y: -10).int
        )
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 10, y: 0).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 10, y: 0).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -10, y: 0).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -10, y: 0).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: -10).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: -10).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: -5).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: -5).int, clockwise: true), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: -5).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: -5).int, clockwise: true), .onBoarder)
    }
    
    
    func test_3() {
        let o = Point(x: 0, y: 0).int
        
        let corner = Corner(
            d0: DBPoint(iPoint: o),
            o: o,
            a: Point(x: -10, y: 0).int,
            b: Point(x: 0, y: -10).int
        )
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: -5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: -5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 0).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 0).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 0).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: -5, y: 0).int, clockwise: true), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: -5).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 0, y: -5).int, clockwise: true), .onBoarder)
    }
    
    
    func test_4() {
        let o = Point(x: 10, y: 10).int
        
        let corner = Corner(
            d0: DBPoint(iPoint: o),
            o: o,
            a: Point(x: 10, y: 20).int,
            b: Point(x: 20, y: 10).int
        )
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 15, y: 15).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 15, y: 15).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 15, y: 5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 15, y: 5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 10, y: 5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 10, y: 5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 15).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 15).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 10).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 5, y: 10).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 10, y: 15).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 10, y: 15).int, clockwise: true), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 15, y: 10).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenIntVersion(p: Point(x: 15, y: 10).int, clockwise: true), .onBoarder)
    }

    func test_5() {
        
        let o = Point(x: 0, y: 0).int
        
        let corner = Corner(
            d0: DBPoint(iPoint: o),
            o: o,
            a: Point(x: 0, y: 10).int,
            b: Point(x: 10, y: 0).int
        )
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 0).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 0).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: 5).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: 5).int, clockwise: true), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 0).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 0).int, clockwise: true), .onBoarder)
    }
    
    
    func test_6() {
        let o = Point(x: 0, y: 0).int
        
        let corner = Corner(
            d0: DBPoint(iPoint: o),
            o: o,
            a: Point(x: -10, y: 0).int,
            b: Point(x: 10, y: 0).int
        )
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 0).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 0).int, clockwise: true), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 0).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 0).int, clockwise: true), .onBoarder)
    }
    
    
    func test_7() {
        let o = Point(x: 0, y: 0).int
        
        let corner = Corner(
            d0: DBPoint(iPoint: o),
            o: o,
            a: Point(x: -10, y: -10).int,
            b: Point(x: 10, y: -10).int
        )
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 10, y: 0).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 10, y: 0).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -10, y: 0).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -10, y: 0).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: -10).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: -10).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: -5).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: -5).int, clockwise: true), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: -5).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: -5).int, clockwise: true), .onBoarder)
    }
    
    
    func test_8() {
        let o = Point(x: 0, y: 0).int
        
        let corner = Corner(
            d0: DBPoint(iPoint: o),
            o: o,
            a: Point(x: -10, y: 0).int,
            b: Point(x: 0, y: -10).int
        )
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: -5).int, clockwise: false), .contain)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: -5).int, clockwise: true), .absent)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: -5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: -5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 0).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 0).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 5).int, clockwise: false), .absent)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 5).int, clockwise: true), .contain)
        
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 0).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: -5, y: 0).int, clockwise: true), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: -5).int, clockwise: false), .onBoarder)
        XCTAssertEqual(corner.isBetweenDoubleVersion(p: Point(x: 0, y: -5).int, clockwise: true), .onBoarder)
    }
    
}

private extension Point {
    
    var int: IntPoint {
        return IntGeom.defGeom.int(point: self)
    }
    
}
