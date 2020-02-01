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
    
    func test_03() {
        let data = CutTestData.data[3]

        let solution = data.shape.cut(path: data.path, iGeom: IntGeom.defGeom)

        
        XCTAssertEqual(solution.isInteract, true)
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 10, isClockWise: false)
        ])
        
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -15, y: 10),
            Point(x: 15, y: 10),
            Point(x: 15, y: -10),
            Point(x: -15, y: -10),
            Point(x: 5, y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -5),
            Point(x: 0, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 0),
            Point(x: -10, y: 0),
            Point(x: -10, y: 5),
            Point(x: 0, y: 5),
            Point(x: 5, y: 5)
            ].int
        )
        XCTAssertEqual(solution.bitList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(solution.bitList.points, [
            Point(x: 5, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: 5),
            Point(x: 5, y: 5),
            Point(x: 0, y: 0),
            Point(x: 0, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 0)
            ].int
        )
    }
    
    func test_04() {
        let data = CutTestData.data[4]

        let solution = data.shape.cut(path: data.path, iGeom: IntGeom.defGeom)

        
        XCTAssertEqual(solution.isInteract, true)
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 8, isClockWise: false),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -10, y: 20),
            Point(x: 10, y: 20),
            Point(x: 10, y: 5),
            Point(x: -10, y: 5),
            Point(x: -5, y: 15),
            Point(x: -5, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: 15),
            Point(x: -10, y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -15),
            Point(x: -10, y: -15),
            Point(x: -5, y: -5),
            Point(x: -5, y: -10),
            Point(x: 5, y: -10),
            Point(x: 5, y: -5),
            Point(x: -30, y: 35),
            Point(x: 30, y: 35),
            Point(x: 30, y: -35),
            Point(x: -30, y: -35),
            Point(x: 10, y: -25),
            Point(x: 20, y: -25),
            Point(x: 20, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: -25),
            Point(x: -10, y: -25),
            Point(x: -10, y: -20),
            Point(x: 10, y: -20),
            Point(x: -5, y: -25),
            Point(x: -5, y: -30),
            Point(x: 5, y: -30),
            Point(x: 5, y: -25)
            ].int
        )
        XCTAssertEqual(solution.bitList.layouts, [
            PlainShape.Layout(begin: 0, length: 24, isClockWise: true)
        ])
        
        XCTAssertEqual(solution.bitList.points, [
            Point(x: -10, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -20),
            Point(x: -10, y: -20),
            Point(x: -10, y: -25),
            Point(x: -20, y: -25),
            Point(x: -20, y: 25),
            Point(x: 20, y: 25),
            Point(x: 20, y: -25),
            Point(x: 10, y: -25),
            Point(x: 10, y: -20),
            Point(x: 15, y: -20),
            Point(x: 15, y: -15),
            Point(x: 10, y: -15),
            Point(x: 10, y: 0),
            Point(x: 15, y: 0),
            Point(x: 15, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: 20),
            Point(x: -10, y: 20),
            Point(x: -10, y: 5),
            Point(x: -15, y: 5),
            Point(x: -15, y: 0),
            Point(x: -10, y: 0)
            ].int
        )
    }
    
    func test_05() {
        let data = CutTestData.data[5]

        let solution = data.shape.cut(path: data.path, iGeom: IntGeom.defGeom)

        
        XCTAssertEqual(solution.isInteract, true)
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 12, isClockWise: false)
        ])
        
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -10, y: 20),
            Point(x: 0, y: 20),
            Point(x: 0, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: 10),
            Point(x: 0, y: 10),
            Point(x: 0, y: 5),
            Point(x: -10, y: 5),
            Point(x: -10, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: -10),
            Point(x: 0, y: -10),
            Point(x: 0, y: -15),
            Point(x: -10, y: -15),
            Point(x: -30, y: 35),
            Point(x: 30, y: 35),
            Point(x: 30, y: -40),
            Point(x: -30, y: -40),
            Point(x: 0, y: -35),
            Point(x: 20, y: -35),
            Point(x: 20, y: 25),
            Point(x: -20, y: 25),
            Point(x: -20, y: -25),
            Point(x: -10, y: -25),
            Point(x: -10, y: -20),
            Point(x: 0, y: -20),
            Point(x: 0, y: -25),
            Point(x: -5, y: -25),
            Point(x: -5, y: -30),
            Point(x: 0, y: -30)
            ].int
        )
        XCTAssertEqual(solution.bitList.layouts, [
            PlainShape.Layout(begin: 0, length: 36, isClockWise: true)
        ])
        
        XCTAssertEqual(solution.bitList.points, [
            Point(x: 0, y: -30),
            Point(x: 5, y: -30),
            Point(x: 5, y: -25),
            Point(x: 0, y: -25),
            Point(x: 0, y: -20),
            Point(x: 15, y: -20),
            Point(x: 15, y: -15),
            Point(x: 0, y: -15),
            Point(x: 0, y: -10),
            Point(x: 5, y: -10),
            Point(x: 5, y: -5),
            Point(x: 0, y: -5),
            Point(x: 0, y: 0),
            Point(x: 15, y: 0),
            Point(x: 15, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: 15),
            Point(x: 0, y: 15),
            Point(x: 0, y: 20),
            Point(x: -10, y: 20),
            Point(x: -10, y: 5),
            Point(x: -15, y: 5),
            Point(x: -15, y: 0),
            Point(x: -10, y: 0),
            Point(x: -10, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -20),
            Point(x: -10, y: -20),
            Point(x: -10, y: -25),
            Point(x: -20, y: -25),
            Point(x: -20, y: 25),
            Point(x: 20, y: 25),
            Point(x: 20, y: -35),
            Point(x: 0, y: -35)
            ].int
        )
    }
    
    func test_06() {
        let data = CutTestData.data[6]

        let solution = data.shape.cut(path: data.path, iGeom: IntGeom.defGeom)


        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [])
        XCTAssertEqual(solution.mainList.points, [])
        
        XCTAssertEqual(solution.bitList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.bitList.points, [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
            ].int
        )
    }
    
    func test_07() {
        let data = CutTestData.data[7]

        let solution = data.shape.cut(path: data.path, iGeom: IntGeom.defGeom)

        
        XCTAssertEqual(solution.isInteract, true)
        XCTAssertEqual(solution.mainList.layouts, [])
        
        XCTAssertEqual(solution.mainList.points, [])
        XCTAssertEqual(solution.bitList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(solution.bitList.points, [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
            ].int
        )
    }
    
    func test_08() {
        let data = CutTestData.data[8]

        let solution = data.shape.cut(path: data.path, iGeom: IntGeom.defGeom)

        
        XCTAssertEqual(solution.isInteract, true)
        XCTAssertEqual(solution.mainList.layouts, [])
        
        XCTAssertEqual(solution.mainList.points, [])
        XCTAssertEqual(solution.bitList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(solution.bitList.points, [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: 5, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: -5),
            Point(x: 5, y: -5)
            ].int
        )
    }
}
