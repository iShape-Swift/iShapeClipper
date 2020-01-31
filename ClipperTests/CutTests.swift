//
//  CutTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 31.01.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper

final class CutTests: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func test_00() {
        let data = CutTestData.data[0]

        let solution = data.shape.cut(path: data.path, iGeom: IntGeom.defGeom)

        
        XCTAssertEqual(solution.isInteract, true)
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -15, y: -15),
            Point(x: -15, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
            ].int
        )
        XCTAssertEqual(solution.bitList.layouts, [])
        
        XCTAssertEqual(solution.bitList.points, [])
    }
    
    func test_01() {
        let data = CutTestData.data[1]

        let solution = data.shape.cut(path: data.path, iGeom: IntGeom.defGeom)

        
        XCTAssertEqual(solution.isInteract, true)
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: -5, y: 5),
            Point(x: -5, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 5)
            ].int
        )
        XCTAssertEqual(solution.bitList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(solution.bitList.points, [
            Point(x: -5, y: 5),
            Point(x: -5, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 5)
            ].int
        )
    }
    
    func test_02() {
        let data = CutTestData.data[2]

        let solution = data.shape.cut(path: data.path, iGeom: IntGeom.defGeom)

        
        XCTAssertEqual(solution.isInteract, true)
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 8, isClockWise: false)
        ])
        
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -15, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -5, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: -10),
            Point(x: -5, y: -10)
            ].int
        )
        XCTAssertEqual(solution.bitList.layouts, [
            PlainShape.Layout(begin: 0, length: 6, isClockWise: true)
        ])
        
        XCTAssertEqual(solution.bitList.points, [
            Point(x: -5, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: -10),
            Point(x: -5, y: -10)
            ].int
        )
    }
}
