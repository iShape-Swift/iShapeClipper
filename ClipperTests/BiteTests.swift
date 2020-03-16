//
//  BiteTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 31.01.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper

final class BiteTests: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func test_00() {
        let data = CutTestData.data[0]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        let plainShape = solution.mainList.get(index: 0)
        XCTAssertEqual(plainShape.isClockWise(index: 0), true)
        XCTAssertEqual(plainShape.isClockWise(index: 1), false)
        
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
        
        XCTAssertEqual(solution.biteList.layouts, [])
        XCTAssertEqual(solution.biteList.points, [])
    }
    
    func test_01() {
        let data = CutTestData.data[1]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        let plainShape = solution.mainList.get(index: 0)
        XCTAssertEqual(plainShape.isClockWise(index: 0), true)
        XCTAssertEqual(plainShape.isClockWise(index: 1), false)
        
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
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 5, y: 5),
            Point(x: 5, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 5)
            ].int
        )
    }
    
    func test_02() {
        let data = CutTestData.data[2]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 8, isClockWise: false)
        ])
        
        let plainShape = solution.mainList.get(index: 0)
        XCTAssertEqual(plainShape.isClockWise(index: 0), true)
        XCTAssertEqual(plainShape.isClockWise(index: 1), false)
        
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
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 6, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
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

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 10, isClockWise: false)
        ])
        
        let plainShape = solution.mainList.get(index: 0)
        XCTAssertEqual(plainShape.isClockWise(index: 0), true)
        XCTAssertEqual(plainShape.isClockWise(index: 1), false)
        
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
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
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

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

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
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 24, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
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

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)
        
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
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 36, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
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

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [])
        XCTAssertEqual(solution.mainList.points, [])
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
            ].int
        )
    }
    
    func test_07() {
        let data = CutTestData.data[7]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)
        
        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [])
        XCTAssertEqual(solution.mainList.points, [])
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(solution.biteList.points, [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
            ].int
        )
    }
    
    func test_08() {
        let data = CutTestData.data[8]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [])
        XCTAssertEqual(solution.mainList.points, [])
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        XCTAssertEqual(solution.biteList.points, [
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
    
    func test_09() {
        let data = CutTestData.data[9]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -5, y: 10),
            Point(x: -5, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 5, y: 10),
            Point(x: 5, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 10)
            ].int
        )
    }
    
    func test_10() {
        let data = CutTestData.data[10]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -5, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -15),
            Point(x: -5, y: -15),
            Point(x: 5, y: -10),
            Point(x: 5, y: -5),
            Point(x: 0, y: -5),
            Point(x: 0, y: -10)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: -5, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 0),
            Point(x: -5, y: 0)
            ].int
        )
    }
    
    func test_11() {
        let data = CutTestData.data[11]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -5 , y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -15),
            Point(x: -5, y: -15),
            Point(x: 5, y: -10),
            Point(x: 5, y: -5),
            Point(x: 0, y: -5),
            Point(x: 0, y: -10),
            Point(x: 10, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: 10),
            Point(x: 10, y: 10)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: -5, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: 0),
            Point(x: -5, y: 0)
            ].int
        )
    }
    
    func test_12() {
        let data = CutTestData.data[12]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)
        
        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 16, isClockWise: true),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 20, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 24, length: 4, isClockWise: false)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: 10, y: -5),
            Point(x: -15, y: -5),
            Point(x: -15, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: -15),
            Point(x: 20, y: -15),
            Point(x: 20, y: -25),
            Point(x: -20, y: -25),
            Point(x: -20, y: 30),
            Point(x: 20, y: 30),
            Point(x: 20, y: 20),
            Point(x: 10, y: 20),
            Point(x: 10, y: 15),
            Point(x: -15, y: 15),
            Point(x: -15, y: 10),
            Point(x: 10, y: 10),
            Point(x: -5, y: 25),
            Point(x: -5, y: 20),
            Point(x: 5, y: 20),
            Point(x: 5, y: 25),
            Point(x: -5, y: 5),
            Point(x: -5, y: 0),
            Point(x: 5, y: 0),
            Point(x: 5, y: 5),
            Point(x: -5, y: -15),
            Point(x: -5, y: -20),
            Point(x: 5, y: -20),
            Point(x: 5, y: -15)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 12, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 10, y: -10),
            Point(x: 15, y: -10),
            Point(x: 15, y: -5),
            Point(x: 10, y: -5),
            Point(x: 10, y: 10),
            Point(x: 15, y: 10),
            Point(x: 15, y: 15),
            Point(x: 10, y: 15),
            Point(x: 10, y: 20),
            Point(x: 20, y: 20),
            Point(x: 20, y: -15),
            Point(x: 10, y: -15)
            ].int
        )
    }
    
    func test_13() {
        let data = CutTestData.data[13]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)
        
        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: 15, y: 10),
            Point(x: 15, y: 15),
            Point(x: -15, y: 15),
            Point(x: -15, y: 10),
            Point(x: -20, y: 10),
            Point(x: -20, y: 30),
            Point(x: 20, y: 30),
            Point(x: 20, y: 10),
            Point(x: -5, y: 25),
            Point(x: -5, y: 20),
            Point(x: 5, y: 20),
            Point(x: 5, y: 25),
            Point(x: -20, y: -10),
            Point(x: 20, y: -10),
            Point(x: 20, y: -25),
            Point(x: -20, y: -25),
            Point(x: -5, y: -15),
            Point(x: -5, y: -20),
            Point(x: 5, y: -20),
            Point(x: 5, y: -15)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 15, y: -10),
            Point(x: 15, y: -5),
            Point(x: -15, y: -5),
            Point(x: -15, y: -10),
            Point(x: -20, y: -10),
            Point(x: -20, y: 10),
            Point(x: 20, y: 10),
            Point(x: 20, y: -10),
            Point(x: -5, y: 5),
            Point(x: -5, y: 0),
            Point(x: 5, y: 0),
            Point(x: 5, y: 5)
            ].int
        )
    }
    
    func test_14() {
        let data = CutTestData.data[14]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 18, isClockWise: true)
        ])
        XCTAssertEqual(solution.mainList.points, [
            IntPoint(x: 75715, y: -50000),
            IntPoint(x: -150000, y: -50000),
            IntPoint(x: -150000, y: -100000),
            IntPoint(x: 150000, y: -100000),
            IntPoint(x: 150000, y: -92623),
            IntPoint(x: 200000, y: -121311),
            IntPoint(x: 200000, y: -150000),
            IntPoint(x: -200000, y: -150000),
            IntPoint(x: -200000, y: 200000),
            IntPoint(x: 200000, y: 200000),
            IntPoint(x: 200000, y: 171311),
            IntPoint(x: -11428, y: 50000),
            IntPoint(x: -50000, y: 50000),
            IntPoint(x: -50000, y: 27869),
            IntPoint(x: -55000, y: 25000),
            IntPoint(x: -50000, y: 22131),
            IntPoint(x: -50000, y: 0),
            IntPoint(x: -11428, y: 0)
            ]
        )
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 9, isClockWise: true),
            PlainShape.Layout(begin: 9, length: 3, isClockWise: true)
        ])

        XCTAssertEqual(solution.biteList.points, [
            IntPoint(x: 150000, y: -92623),
            IntPoint(x: 150000, y: -50000),
            IntPoint(x: 75715, y: -50000),
            IntPoint(x: -11428, y: 0),
            IntPoint(x: 50000, y: 0),
            IntPoint(x: 50000, y: 50000),
            IntPoint(x: -11428, y: 50000),
            IntPoint(x: 200000, y: 171311),
            IntPoint(x: 200000, y: -121311),
            IntPoint(x: -50000, y: 27869),
            IntPoint(x: -50000, y: 22131),
            IntPoint(x: -55000, y: 25000)
            ]
        )
    }
    
    func test_15() {
        let data = CutTestData.data[15]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 22, isClockWise: true)
        ])
        XCTAssertEqual(solution.mainList.points, [
            IntPoint(x: 75715, y: -50000),
            IntPoint(x: -150000, y: -50000),
            IntPoint(x: -150000, y: -100000),
            IntPoint(x: 150000, y: -100000),
            IntPoint(x: 150000, y: -92623),
            IntPoint(x: 200000, y: -121311),
            IntPoint(x: 200000, y: -150000),
            IntPoint(x: -200000, y: -150000),
            IntPoint(x: -200000, y: 200000),
            IntPoint(x: 200000, y: 200000),
            IntPoint(x: 200000, y: -110000),
            IntPoint(x: 150000, y: -70000),
            IntPoint(x: 150000, y: -50000),
            IntPoint(x: 125000, y: -50000),
            IntPoint(x: 50000, y: 10000),
            IntPoint(x: 50000, y: 50000),
            IntPoint(x: -50000, y: 50000),
            IntPoint(x: -50000, y: 27273),
            IntPoint(x: -55000, y: 25000),
            IntPoint(x: -50000, y: 22131),
            IntPoint(x: -50000, y: 0),
            IntPoint(x: -11428, y: 0)
            ]
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 5, isClockWise: true),
            PlainShape.Layout(begin: 5, length: 3, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            IntPoint(x: 125000, y: -50000),
            IntPoint(x: 75715, y: -50000),
            IntPoint(x: -11428, y: 0),
            IntPoint(x: 50000, y: 0),
            IntPoint(x: 50000, y: 10000),
            IntPoint(x: -50000, y: 27273),
            IntPoint(x: -50000, y: 22131),
            IntPoint(x: -55000, y: 25000),
            IntPoint(x: 150000, y: -92623),
            IntPoint(x: 150000, y: -70000),
            IntPoint(x: 200000, y: -110000),
            IntPoint(x: 200000, y: -121311)
            ]
        )
    }
    
    func test_16() {
        let data = CutTestData.data[16]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.segments, [
            PlainShapeList.Segment(begin: 0, length: 1),
            PlainShapeList.Segment(begin: 1, length: 1),
            PlainShapeList.Segment(begin: 2, length: 1)
        ])
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: 0, y: -5),
            Point(x: 0, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 0, y: 10),
            Point(x: 0, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: -5),
            Point(x: 5, y: -10),
            Point(x: 5, y: -5),
            Point(x: 10, y: -5),
            Point(x: 10, y: -10),
            Point(x: 5, y: 5),
            Point(x: 5, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: 5)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 5, y: -5),
            Point(x: 5, y: -10),
            Point(x: 0, y: -10),
            Point(x: 0, y: -5),
            Point(x: 5, y: 10),
            Point(x: 5, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 10)
            ].int
        )
    }
    
    func test_17() {
        let data = CutTestData.data[17]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 16, isClockWise: true)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: 0, y: -5),
            Point(x: 0, y: -15),
            Point(x: 5, y: -15),
            Point(x: 5, y: -5),
            Point(x: 10, y: -5),
            Point(x: 10, y: -20),
            Point(x: -10, y: -20),
            Point(x: -10, y: 20),
            Point(x: 10, y: 20),
            Point(x: 10, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: 15),
            Point(x: 0, y: 15),
            Point(x: 0, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: -5)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 5, y: -5),
            Point(x: 5, y: -15),
            Point(x: 0, y: -15),
            Point(x: 0, y: -5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 15),
            Point(x: 5, y: 15),
            Point(x: 5, y: 5)
            ].int
        )
    }
    
    func test_18() {
        let data = CutTestData.data[18]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 20, isClockWise: true)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: 0, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: 10),
            Point(x: 0, y: 10),
            Point(x: 0, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: -5),
            Point(x: 0, y: -5),
            Point(x: 0, y: -20),
            Point(x: 15, y: -20),
            Point(x: 15, y: -5),
            Point(x: 20, y: -5),
            Point(x: 20, y: -25),
            Point(x: -10, y: -25),
            Point(x: -10, y: 25),
            Point(x: 20, y: 25),
            Point(x: 20, y: 5),
            Point(x: 15, y: 5),
            Point(x: 15, y: 20),
            Point(x: 0, y: 20)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 15, y: -5),
            Point(x: 15, y: -20),
            Point(x: 0, y: -20),
            Point(x: 0, y: -5),
            Point(x: 5, y: -10),
            Point(x: 5, y: -15),
            Point(x: 10, y: -15),
            Point(x: 10, y: -10),
            Point(x: 0, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: 15),
            Point(x: 0, y: 15),
            Point(x: 0, y: 20),
            Point(x: 15, y: 20),
            Point(x: 15, y: 5),
            Point(x: 0, y: 5)
            ].int
        )
    }
    
    func test_19() {
        let data = CutTestData.data[19]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 8, isClockWise: false)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 5),
            Point(x: 10, y: 5),
            Point(x: -5, y: 0),
            Point(x: -5, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 0),
            Point(x: -25, y: 20),
            Point(x: 25, y: 20),
            Point(x: 25, y: -20),
            Point(x: -25, y: -20),
            Point(x: -15, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: 5),
            Point(x: 20, y: 5),
            Point(x: 20, y: 15),
            Point(x: -20, y: 15),
            Point(x: -20, y: 5),
            Point(x: -15, y: 5)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 10, y: 5),
            Point(x: 15, y: 5),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: 5),
            Point(x: -10, y: 5),
            Point(x: -10, y: -10),
            Point(x: 10, y: -10)
            ].int
        )
    }
    
     func test_20() {
         let data = CutTestData.data[20]

         let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

         XCTAssertEqual(solution.isInteract, true)
         
         XCTAssertEqual(solution.mainList.layouts, [
             PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
             PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
             PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
             PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
             PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
             PlainShape.Layout(begin: 4, length: 12, isClockWise: false)
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
             Point(x: 10, y: -20),
             Point(x: -10, y: -20),
             Point(x: -10, y: -5),
             Point(x: 10, y: -5),
             Point(x: -5, y: -10),
             Point(x: -5, y: -15),
             Point(x: 5, y: -15),
             Point(x: 5, y: -10),
             Point(x: -25, y: 30),
             Point(x: 25, y: 30),
             Point(x: 25, y: -30),
             Point(x: -25, y: -30),
             Point(x: -15, y: -25),
             Point(x: 15, y: -25),
             Point(x: 15, y: -5),
             Point(x: 20, y: -5),
             Point(x: 20, y: 5),
             Point(x: 15, y: 5),
             Point(x: 15, y: 25),
             Point(x: -15, y: 25),
             Point(x: -15, y: 5),
             Point(x: -20, y: 5),
             Point(x: -20, y: -5),
             Point(x: -15, y: -5)
             ].int
         )
         
         XCTAssertEqual(solution.biteList.layouts, [
             PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
             PlainShape.Layout(begin: 8, length: 8, isClockWise: true)
         ])
         XCTAssertEqual(solution.biteList.points, [
             Point(x: -10, y: 5),
             Point(x: -15, y: 5),
             Point(x: -15, y: 25),
             Point(x: 15, y: 25),
             Point(x: 15, y: 5),
             Point(x: 10, y: 5),
             Point(x: 10, y: 20),
             Point(x: -10, y: 20),
             Point(x: -15, y: -5),
             Point(x: -10, y: -5),
             Point(x: -10, y: -20),
             Point(x: 10, y: -20),
             Point(x: 10, y: -5),
             Point(x: 15, y: -5),
             Point(x: 15, y: -25),
             Point(x: -15, y: -25)
             ].int
         )
     }
    
    func test_21() {
        let data = CutTestData.data[21]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -15, y: 10),
            Point(x: 15, y: 10),
            Point(x: 15, y: -10),
            Point(x: -15, y: -10),
            Point(x: 10, y: 5),
            Point(x: 10, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: 5)
            ].int
        )

        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 5, y: -5),
            Point(x: 5, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: -5),
            Point(x: -5, y: 5),
            Point(x: -5, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: 5)
            ].int
        )
    }
    
    func test_22() {
        let data = CutTestData.data[22]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 22, isClockWise: false)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 5),
            Point(x: 10, y: 5),
            Point(x: -5, y: 0),
            Point(x: -5, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 0),
            Point(x: -25, y: 20),
            Point(x: 25, y: 20),
            Point(x: 25, y: -20),
            Point(x: -25, y: -20),
            Point(x: 10, y: -15),
            Point(x: 20, y: -15),
            Point(x: 20, y: -10),
            Point(x: 15, y: -10),
            Point(x: 15, y: -5),
            Point(x: 20, y: -5),
            Point(x: 20, y: 0),
            Point(x: 15, y: 0),
            Point(x: 15, y: 5),
            Point(x: 20, y: 5),
            Point(x: 20, y: 15),
            Point(x: -20, y: 15),
            Point(x: -20, y: 5),
            Point(x: -15, y: 5),
            Point(x: -15, y: 0),
            Point(x: -20, y: 0),
            Point(x: -20, y: -5),
            Point(x: -15, y: -5),
            Point(x: -15, y: -10),
            Point(x: -20, y: -10),
            Point(x: -20, y: -15),
            Point(x: -10, y: -15)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 20, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: 10, y: 5),
            Point(x: 15, y: 5),
            Point(x: 15, y: 0),
            Point(x: 10, y: 0),
            Point(x: 15, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: -5),
            Point(x: 15, y: -5),
            Point(x: -5, y: -10),
            Point(x: -5, y: -15),
            Point(x: -10, y: -15),
            Point(x: -10, y: -10),
            Point(x: -10, y: 0),
            Point(x: -15, y: 0),
            Point(x: -15, y: 5),
            Point(x: -10, y: 5),
            Point(x: -10, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: -5),
            Point(x: -10, y: -5),
            Point(x: 5, y: -15),
            Point(x: 5, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: -15)
            ].int
        )
    }
    
    func test_23() {
        let data = CutTestData.data[23]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 20, isClockWise: false)
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
            Point(x: 10, y: -20),
            Point(x: -10, y: -20),
            Point(x: -10, y: -5),
            Point(x: 10, y: -5),
            Point(x: -5, y: -10),
            Point(x: -5, y: -15),
            Point(x: 5, y: -15),
            Point(x: 5, y: -10),
            Point(x: -25, y: 30),
            Point(x: 25, y: 30),
            Point(x: 25, y: -30),
            Point(x: -25, y: -30),
            Point(x: -15, y: 5),
            Point(x: -20, y: 5),
            Point(x: -20, y: -5),
            Point(x: -15, y: -5),
            Point(x: -15, y: -25),
            Point(x: 15, y: -25),
            Point(x: 15, y: -15),
            Point(x: 20, y: -15),
            Point(x: 20, y: -10),
            Point(x: 15, y: -10),
            Point(x: 15, y: -5),
            Point(x: 20, y: -5),
            Point(x: 20, y: 5),
            Point(x: 15, y: 5),
            Point(x: 15, y: 25),
            Point(x: -15, y: 25),
            Point(x: -15, y: 15),
            Point(x: -20, y: 15),
            Point(x: -20, y: 10),
            Point(x: -15, y: 10)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 16, length: 6, isClockWise: true),
            PlainShape.Layout(begin: 22, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 26, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 30, length: 6, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: -15, y: 10),
            Point(x: -10, y: 10),
            Point(x: -10, y: 5),
            Point(x: -15, y: 5),
            Point(x: -10, y: -25),
            Point(x: -10, y: -20),
            Point(x: -5, y: -20),
            Point(x: -5, y: -25),
            Point(x: 15, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: -5),
            Point(x: 15, y: -5),
            Point(x: -10, y: -20),
            Point(x: -15, y: -20),
            Point(x: -15, y: -5),
            Point(x: -10, y: -5),
            Point(x: 10, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: -25),
            Point(x: 5, y: -25),
            Point(x: 5, y: -20),
            Point(x: 10, y: -20),
            Point(x: 10, y: 25),
            Point(x: 10, y: 20),
            Point(x: 5, y: 20),
            Point(x: 5, y: 25),
            Point(x: 10, y: 20),
            Point(x: 15, y: 20),
            Point(x: 15, y: 5),
            Point(x: 10, y: 5),
            Point(x: -10, y: 15),
            Point(x: -15, y: 15),
            Point(x: -15, y: 25),
            Point(x: -5, y: 25),
            Point(x: -5, y: 20),
            Point(x: -10, y: 20)
            ].int
        )
    }
    
    func test_24() {
        let data = CutTestData.data[24]

        let solution = data.shape.bite(path: data.path, iGeom: IntGeom.defGeom)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [
            PlainShape.Layout(begin: 0, length: 12, isClockWise: true),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 16, isClockWise: false)
        ])
        XCTAssertEqual(solution.mainList.points, [
            Point(x: 5, y: -10),
            Point(x: 5, y: -7.5),
            Point(x: -5, y: -7.5),
            Point(x: -5, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 0),
            Point(x: -10, y: 0),
            Point(x: -10, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: -10),
            Point(x: 0, y: 0),
            Point(x: 0, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 0),
            Point(x: -25, y: 20),
            Point(x: 25, y: 20),
            Point(x: 25, y: -20),
            Point(x: -25, y: -20),
            Point(x: 15, y: -15),
            Point(x: 15, y: 5),
            Point(x: 20, y: 5),
            Point(x: 20, y: 15),
            Point(x: -20, y: 15),
            Point(x: -20, y: 5),
            Point(x: -15, y: 5),
            Point(x: -15, y: 0),
            Point(x: -20, y: 0),
            Point(x: -20, y: -5),
            Point(x: -15, y: -5),
            Point(x: -15, y: -15),
            Point(x: -5, y: -15),
            Point(x: -5, y: -17.5),
            Point(x: 5, y: -17.5),
            Point(x: 5, y: -15)
            ].int
        )
        
        XCTAssertEqual(solution.biteList.layouts, [
            PlainShape.Layout(begin: 0, length: 6, isClockWise: true),
            PlainShape.Layout(begin: 6, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 10, length: 6, isClockWise: true)
        ])
        XCTAssertEqual(solution.biteList.points, [
            Point(x: -5, y: -10),
            Point(x: -5, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: -10),
            Point(x: -10, y: 0),
            Point(x: -15, y: 0),
            Point(x: -15, y: 5),
            Point(x: -10, y: 5),
            Point(x: 5, y: -15),
            Point(x: 5, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 5),
            Point(x: 15, y: 5),
            Point(x: 15, y: -15)
            ].int
        )
    }
}
