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

final class ComplexSubtract: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func test_00() {
        let data = ComplexTestData.data[0]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, false)
    }
    
    func test_01() {
        let data = ComplexTestData.data[1]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape.points, [
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
        
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])

        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.points, [
            Point(x: 5, y: 5),
            Point(x: 5, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 5)
            ].int
        )
    }
    
    func test_02() {
        let data = ComplexTestData.data[2]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 8, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -15, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15),
            Point(x: -5, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 5),
            Point(x: 5, y: 5),
            Point(x: 5, y: 10),
            Point(x: -10, y: 10),
            Point(x: -10, y: -5),
            Point(x: -5, y: -5)
            ].int
        )
        
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 6, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.points, [
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
        let data = ComplexTestData.data[3]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 10, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(solution.mainList.points, [
            Point(x: -15, y: 10),
            Point(x: 15, y: 10),
            Point(x: 15, y: -10),
            Point(x: -15, y: -10),
            Point(x: 5, y: 5),
            Point(x: 0, y: 5),
            Point(x: -10, y: 5),
            Point(x: -10, y: 0),
            Point(x: -5, y: 0),
            Point(x: -5, y: -5),
            Point(x: 0, y: -5),
            Point(x: 10, y: -5),
            Point(x: 10, y: 0),
            Point(x: 5, y: 0)
            ].int
        )
        
        XCTAssertEqual(solution.partList.segments.count, 2)
        
        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)

        XCTAssertEqual(partShape0.points, [
            Point(x: 5, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: 5),
            Point(x: 5, y: 5)
            ].int
        )
        
        XCTAssertEqual(partShape1.points, [
            Point(x: 0, y: 0),
            Point(x: 0, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 0)
            ].int
        )
    }
    
    func test_04() {
        let data = ComplexTestData.data[4]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.segments.count, 3)

        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        let mainShape2 = solution.mainList.get(index: 2)
        
        XCTAssertEqual(mainShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        XCTAssertEqual(mainShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
        ])
        
        XCTAssertEqual(mainShape2.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 8, isClockWise: false),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape0.isClockWise(index: 1), false)

        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape1.isClockWise(index: 1), false)

        XCTAssertEqual(mainShape2.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape2.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape2.isClockWise(index: 2), false)
        
        XCTAssertEqual(mainShape0.points, [
            Point(x: -10, y: 20),
            Point(x: 10, y: 20),
            Point(x: 10, y: 5),
            Point(x: -10, y: 5),
            Point(x: -5, y: 15),
            Point(x: -5, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: 15)
            ].int
        )
        
        XCTAssertEqual(mainShape1.points, [
            Point(x: -10, y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -15),
            Point(x: -10, y: -15),
            Point(x: -5, y: -5),
            Point(x: -5, y: -10),
            Point(x: 5, y: -10),
            Point(x: 5, y: -5)
            ].int
        )
        
        XCTAssertEqual(mainShape2.points, [
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
        
        XCTAssertEqual(solution.partList.segments.count, 1)
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 24, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.points, [
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
        let data = ComplexTestData.data[5]

        let solution = data.shape.complexSubtract(path: data.path)
        
        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.segments.count, 3)

        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        let mainShape2 = solution.mainList.get(index: 2)

        XCTAssertEqual(mainShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
        ])
        
        XCTAssertEqual(mainShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
        ])
        
        XCTAssertEqual(mainShape2.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 12, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)

        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)

        XCTAssertEqual(mainShape2.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape2.isClockWise(index: 1), false)

        XCTAssertEqual(mainShape0.points, [
            Point(x: -10, y: 20),
            Point(x: 0, y: 20),
            Point(x: 0, y: 15),
            Point(x: -5, y: 15),
            Point(x: -5, y: 10),
            Point(x: 0, y: 10),
            Point(x: 0, y: 5),
            Point(x: -10, y: 5)
            ].int
        )
        
        XCTAssertEqual(mainShape1.points, [
            Point(x: -10, y: 0),
            Point(x: 0, y: 0),
            Point(x: 0, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: -10),
            Point(x: 0, y: -10),
            Point(x: 0, y: -15),
            Point(x: -10, y: -15)
            ].int
        )
        
        XCTAssertEqual(mainShape2.points, [
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
        
        let partShape = solution.partList.get(index: 0)
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 36, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.points, [
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
        let data = ComplexTestData.data[6]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [])
        XCTAssertEqual(solution.mainList.points, [])
        
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.points, [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
            ].int
        )
    }
    
    func test_07() {
        let data = ComplexTestData.data[7]

        let solution = data.shape.complexSubtract(path: data.path)
        
        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [])
        XCTAssertEqual(solution.mainList.points, [])
        
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.points, [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
            ].int
        )
    }
    
    func test_08() {
        let data = ComplexTestData.data[8]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.layouts, [])
        XCTAssertEqual(solution.mainList.points, [])
        
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        XCTAssertEqual(partShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(partShape.points, [
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
        let data = ComplexTestData.data[9]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(mainShape.points, [
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
        
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.points, [
            Point(x: 5, y: 10),
            Point(x: 5, y: -5),
            Point(x: -5, y: -5),
            Point(x: -5, y: 10)
            ].int
        )
    }
    
    func test_10() {
        let data = ComplexTestData.data[10]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape.points, [
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
        
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.points, [
            Point(x: -5, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 0),
            Point(x: -5, y: 0)
            ].int
        )
    }
    
    func test_11() {
        let data = ComplexTestData.data[11]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)

        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        
        XCTAssertEqual(mainShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape0.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)
        
        XCTAssertEqual(mainShape0.points, [
            Point(x: -5 , y: 0),
            Point(x: 10, y: 0),
            Point(x: 10, y: -15),
            Point(x: -5, y: -15),
            Point(x: 5, y: -10),
            Point(x: 5, y: -5),
            Point(x: 0, y: -5),
            Point(x: 0, y: -10)
            ].int
        )
        XCTAssertEqual(mainShape1.points, [
            Point(x: 10, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: 10),
            Point(x: 10, y: 10)
            ].int
        )
        
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)

        XCTAssertEqual(partShape.points, [
            Point(x: -5, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: 0),
            Point(x: -5, y: 0)
            ].int
        )
    }
    
    func test_12() {
        let data = ComplexTestData.data[12]

        let solution = data.shape.complexSubtract(path: data.path)
        
        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 16, isClockWise: true),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 20, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 24, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(mainShape.points, [
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
        
        let partShape = solution.partList.get(index: 0)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 12, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.points, [
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
        let data = ComplexTestData.data[13]

        let solution = data.shape.complexSubtract(path: data.path)
        
        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        
        XCTAssertEqual(mainShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape0.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape1.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape0.points, [
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
            Point(x: 5, y: 25)
            ].int
        )
        
        XCTAssertEqual(mainShape1.points, [
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
        
        let partShape = solution.partList.get(index: 0)
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(partShape.isClockWise(index: 0), true)
        XCTAssertEqual(partShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(partShape.points, [
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
        let data = ComplexTestData.data[14]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 18, isClockWise: true)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)

        XCTAssertEqual(mainShape.points, [
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
        
        XCTAssertEqual(solution.partList.segments.count, 2)
        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 9, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 3, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)

        XCTAssertEqual(partShape0.points, [
            IntPoint(x: 150000, y: -92623),
            IntPoint(x: 150000, y: -50000),
            IntPoint(x: 75715, y: -50000),
            IntPoint(x: -11428, y: 0),
            IntPoint(x: 50000, y: 0),
            IntPoint(x: 50000, y: 50000),
            IntPoint(x: -11428, y: 50000),
            IntPoint(x: 200000, y: 171311),
            IntPoint(x: 200000, y: -121311)
            ]
        )
        
        XCTAssertEqual(partShape1.points, [
            IntPoint(x: -50000, y: 27869),
            IntPoint(x: -50000, y: 22131),
            IntPoint(x: -55000, y: 25000)
            ]
        )
    }
    
    func test_15() {
        let data = ComplexTestData.data[15]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 22, isClockWise: true)
        ])
        XCTAssertEqual(mainShape.points, [
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
        
        XCTAssertEqual(solution.partList.segments.count, 3)
        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        let partShape2 = solution.partList.get(index: 2)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 5, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 3, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape2.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)
        XCTAssertEqual(partShape2.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape0.points, [
            IntPoint(x: 125000, y: -50000),
            IntPoint(x: 75715, y: -50000),
            IntPoint(x: -11428, y: 0),
            IntPoint(x: 50000, y: 0),
            IntPoint(x: 50000, y: 10000)
            ]
        )
        
        XCTAssertEqual(partShape1.points, [
            IntPoint(x: -50000, y: 27273),
            IntPoint(x: -50000, y: 22131),
            IntPoint(x: -55000, y: 25000)
            ]
        )
        
        XCTAssertEqual(partShape2.points, [
            IntPoint(x: 150000, y: -92623),
            IntPoint(x: 150000, y: -70000),
            IntPoint(x: 200000, y: -110000),
            IntPoint(x: 200000, y: -121311)
            ]
        )
    }
    
    func test_16() {
        let data = ComplexTestData.data[16]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.segments, [
            PlainShapeList.Segment(begin: 0, length: 1),
            PlainShapeList.Segment(begin: 1, length: 1),
            PlainShapeList.Segment(begin: 2, length: 1)
        ])
        
        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        let mainShape2 = solution.mainList.get(index: 2)
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape2.isClockWise(index: 0), true)
        
        XCTAssertEqual(mainShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        
        XCTAssertEqual(mainShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(mainShape2.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(mainShape0.points, [
            Point(x: 0, y: -5),
            Point(x: 0, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 0, y: 10),
            Point(x: 0, y: 5),
            Point(x: -5, y: 5),
            Point(x: -5, y: -5)
            ].int
        )
        
        XCTAssertEqual(mainShape1.points, [
            Point(x: 5, y: -10),
            Point(x: 5, y: -5),
            Point(x: 10, y: -5),
            Point(x: 10, y: -10)
            ].int
        )
        
        XCTAssertEqual(mainShape2.points, [
            Point(x: 5, y: 5),
            Point(x: 5, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: 5)
            ].int
        )
        
        XCTAssertEqual(solution.partList.segments.count, 2)
        
        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape0.points, [
            Point(x: 5, y: -5),
            Point(x: 5, y: -10),
            Point(x: 0, y: -10),
            Point(x: 0, y: -5)
            ].int
        )
        
        XCTAssertEqual(partShape1.points, [
            Point(x: 5, y: 10),
            Point(x: 5, y: 5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 10)
            ].int
        )
    }
    
    func test_17() {
        let data = ComplexTestData.data[17]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 16, isClockWise: true)
        ])
        XCTAssertEqual(mainShape.points, [
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
        
        XCTAssertEqual(solution.partList.segments.count, 2)
        
        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape0.points, [
            Point(x: 5, y: -5),
            Point(x: 5, y: -15),
            Point(x: 0, y: -15),
            Point(x: 0, y: -5)
            ].int
        )
        
        XCTAssertEqual(partShape1.points, [
            Point(x: 0, y: 5),
            Point(x: 0, y: 15),
            Point(x: 5, y: 15),
            Point(x: 5, y: 5)
            ].int
        )
    }
    
    func test_18() {
        let data = ComplexTestData.data[18]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        let mainShape = solution.mainList.get(index: 0)
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 20, isClockWise: true)
        ])
        XCTAssertEqual(mainShape.points, [
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
        
        XCTAssertEqual(solution.partList.segments.count, 2)
        
        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape0.isClockWise(index: 1), false)
        
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)
        
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.points, [
            Point(x: 15, y: -5),
            Point(x: 15, y: -20),
            Point(x: 0, y: -20),
            Point(x: 0, y: -5),
            Point(x: 5, y: -10),
            Point(x: 5, y: -15),
            Point(x: 10, y: -15),
            Point(x: 10, y: -10)
            ].int
        )
        
        XCTAssertEqual(partShape1.points, [
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
        let data = ComplexTestData.data[19]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.segments.count, 2)

        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape0.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape1.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 8, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape0.points, [
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 5),
            Point(x: 10, y: 5),
            Point(x: -5, y: 0),
            Point(x: -5, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 0)
            ].int
        )
        
        XCTAssertEqual(mainShape1.points, [
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
        
        let partShape = solution.partList.get(index: 0)
        XCTAssertEqual(partShape.isClockWise(index: 0), true)

        XCTAssertEqual(partShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        XCTAssertEqual(partShape.points, [
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
        let data = ComplexTestData.data[20]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        XCTAssertEqual(solution.mainList.segments.count, 3)

        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        let mainShape2 = solution.mainList.get(index: 2)
        
        XCTAssertEqual(mainShape0.layouts, [
             PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
             PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape1.layouts, [
             PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
             PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape2.layouts, [
             PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
             PlainShape.Layout(begin: 4, length: 12, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape0.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape1.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape2.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape2.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape0.points, [
            Point(x: -10, y: 20),
            Point(x: 10, y: 20),
            Point(x: 10, y: 5),
            Point(x: -10, y: 5),
            Point(x: -5, y: 15),
            Point(x: -5, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: 15)
            ].int
        )
        
        XCTAssertEqual(mainShape1.points, [
            Point(x: 10, y: -20),
            Point(x: -10, y: -20),
            Point(x: -10, y: -5),
            Point(x: 10, y: -5),
            Point(x: -5, y: -10),
            Point(x: -5, y: -15),
            Point(x: 5, y: -15),
            Point(x: 5, y: -10)
            ].int
        )
        
        XCTAssertEqual(mainShape2.points, [
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
        
        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape0.points, [
            Point(x: -10, y: 5),
            Point(x: -15, y: 5),
            Point(x: -15, y: 25),
            Point(x: 15, y: 25),
            Point(x: 15, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: 20),
            Point(x: -10, y: 20)
            ].int
        )
        
        XCTAssertEqual(partShape1.points, [
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
        let data = ComplexTestData.data[21]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)

        let mainShape = solution.mainList.get(index: 0)
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        XCTAssertEqual(mainShape.points, [
            Point(x: -15, y: 10),
            Point(x: 15, y: 10),
            Point(x: 15, y: -10),
            Point(x: -15, y: -10),
            Point(x: -10, y: 5),
            Point(x: -10, y: -5),
            Point(x: 10, y: -5),
            Point(x: 10, y: 5)
            ].int
        )

        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape0.points, [
            Point(x: 5, y: -5),
            Point(x: 5, y: 5),
            Point(x: 10, y: 5),
            Point(x: 10, y: -5)
            ].int
        )
        
        XCTAssertEqual(partShape1.points, [
            Point(x: -5, y: 5),
            Point(x: -5, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: 5)
            ].int
        )
    }
    
    func test_22() {
        let data = ComplexTestData.data[22]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)
        
        XCTAssertEqual(solution.mainList.segments.count, 2)

        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape0.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape1.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 22, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape0.points, [
            Point(x: 10, y: -10),
            Point(x: -10, y: -10),
            Point(x: -10, y: 5),
            Point(x: 10, y: 5),
            Point(x: -5, y: 0),
            Point(x: -5, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 0)
            ].int
        )
        
        XCTAssertEqual(mainShape1.points, [
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

        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        let partShape2 = solution.partList.get(index: 2)
        let partShape3 = solution.partList.get(index: 3)
        let partShape4 = solution.partList.get(index: 4)
        let partShape5 = solution.partList.get(index: 5)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape2.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape3.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape4.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape5.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)
        XCTAssertEqual(partShape2.isClockWise(index: 0), true)
        XCTAssertEqual(partShape3.isClockWise(index: 0), true)
        XCTAssertEqual(partShape4.isClockWise(index: 0), true)
        XCTAssertEqual(partShape5.isClockWise(index: 0), true)

        XCTAssertEqual(partShape0.points, [
            Point(x: 10, y: 5),
            Point(x: 15, y: 5),
            Point(x: 15, y: 0),
            Point(x: 10, y: 0)
            ].int
        )
        
        XCTAssertEqual(partShape1.points, [
            Point(x: 15, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: -5),
            Point(x: 15, y: -5)
            ].int
        )
        
        XCTAssertEqual(partShape2.points, [
            Point(x: -5, y: -10),
            Point(x: -5, y: -15),
            Point(x: -10, y: -15),
            Point(x: -10, y: -10)
            ].int
        )
        
        XCTAssertEqual(partShape3.points, [
            Point(x: -10, y: 0),
            Point(x: -15, y: 0),
            Point(x: -15, y: 5),
            Point(x: -10, y: 5)
            ].int
        )
        
        XCTAssertEqual(partShape4.points, [
            Point(x: -10, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: -5),
            Point(x: -10, y: -5)
            ].int
        )
        
        XCTAssertEqual(partShape5.points, [
            Point(x: 5, y: -15),
            Point(x: 5, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: -15)
            ].int
        )
    }
    
    func test_23() {
        let data = ComplexTestData.data[23]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)

        XCTAssertEqual(solution.mainList.segments.count, 3)

        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        let mainShape2 = solution.mainList.get(index: 2)
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape0.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape1.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape2.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape2.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
        ])
        
        XCTAssertEqual(mainShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape2.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 20, isClockWise: false)
        ])
        
        
        XCTAssertEqual(mainShape0.points, [
            Point(x: -10, y: 20),
            Point(x: 10, y: 20),
            Point(x: 10, y: 5),
            Point(x: -10, y: 5),
            Point(x: -5, y: 15),
            Point(x: -5, y: 10),
            Point(x: 5, y: 10),
            Point(x: 5, y: 15)
            ].int
        )
        
        XCTAssertEqual(mainShape1.points, [
            Point(x: 10, y: -20),
            Point(x: -10, y: -20),
            Point(x: -10, y: -5),
            Point(x: 10, y: -5),
            Point(x: -5, y: -10),
            Point(x: -5, y: -15),
            Point(x: 5, y: -15),
            Point(x: 5, y: -10)
            ].int
        )
        
        XCTAssertEqual(mainShape2.points, [
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
        
        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        let partShape2 = solution.partList.get(index: 2)
        let partShape3 = solution.partList.get(index: 3)
        let partShape4 = solution.partList.get(index: 4)
        let partShape5 = solution.partList.get(index: 5)
        let partShape6 = solution.partList.get(index: 6)
        let partShape7 = solution.partList.get(index: 7)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape2.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape3.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape4.layouts, [
            PlainShape.Layout(begin: 0, length: 6, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape5.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        
        XCTAssertEqual(partShape6.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape7.layouts, [
            PlainShape.Layout(begin: 0, length: 6, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)
        XCTAssertEqual(partShape2.isClockWise(index: 0), true)
        XCTAssertEqual(partShape3.isClockWise(index: 0), true)
        XCTAssertEqual(partShape4.isClockWise(index: 0), true)
        XCTAssertEqual(partShape5.isClockWise(index: 0), true)
        XCTAssertEqual(partShape6.isClockWise(index: 0), true)
        XCTAssertEqual(partShape7.isClockWise(index: 0), true)

        XCTAssertEqual(partShape0.points, [
            Point(x: -15, y: 10),
            Point(x: -10, y: 10),
            Point(x: -10, y: 5),
            Point(x: -15, y: 5)
            ].int
        )
        
        XCTAssertEqual(partShape1.points, [
            Point(x: -10, y: -25),
            Point(x: -10, y: -20),
            Point(x: -5, y: -20),
            Point(x: -5, y: -25)
            ].int
        )
        
        XCTAssertEqual(partShape2.points, [
            Point(x: 15, y: -10),
            Point(x: 10, y: -10),
            Point(x: 10, y: -5),
            Point(x: 15, y: -5)
            ].int
        )
        
        XCTAssertEqual(partShape3.points, [
            Point(x: -10, y: -20),
            Point(x: -15, y: -20),
            Point(x: -15, y: -5),
            Point(x: -10, y: -5)
            ].int
        )
        
        XCTAssertEqual(partShape4.points, [
            Point(x: 10, y: -15),
            Point(x: 15, y: -15),
            Point(x: 15, y: -25),
            Point(x: 5, y: -25),
            Point(x: 5, y: -20),
            Point(x: 10, y: -20)
            ].int
        )
        
        XCTAssertEqual(partShape5.points, [
            Point(x: 10, y: 25),
            Point(x: 10, y: 20),
            Point(x: 5, y: 20),
            Point(x: 5, y: 25)
            ].int
        )
        
        XCTAssertEqual(partShape6.points, [
            Point(x: 10, y: 20),
            Point(x: 15, y: 20),
            Point(x: 15, y: 5),
            Point(x: 10, y: 5)
            ].int
        )
        
        XCTAssertEqual(partShape7.points, [
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
        let data = ComplexTestData.data[24]

        let solution = data.shape.complexSubtract(path: data.path)

        XCTAssertEqual(solution.isInteract, true)

        XCTAssertEqual(solution.mainList.segments.count, 2)

        let mainShape0 = solution.mainList.get(index: 0)
        let mainShape1 = solution.mainList.get(index: 1)
        
        XCTAssertEqual(mainShape0.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape0.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape1.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape1.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 12, isClockWise: true),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 16, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape0.points, [
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
            Point(x: 5, y: 0)
            ].int
        )
        
        XCTAssertEqual(mainShape1.points, [
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
        
        let partShape0 = solution.partList.get(index: 0)
        let partShape1 = solution.partList.get(index: 1)
        let partShape2 = solution.partList.get(index: 2)
        
        XCTAssertEqual(partShape0.layouts, [
            PlainShape.Layout(begin: 0, length: 6, isClockWise: true)
        ])
        XCTAssertEqual(partShape1.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        XCTAssertEqual(partShape2.layouts, [
            PlainShape.Layout(begin: 0, length: 6, isClockWise: true)
        ])
        
        XCTAssertEqual(partShape0.isClockWise(index: 0), true)
        XCTAssertEqual(partShape1.isClockWise(index: 0), true)
        XCTAssertEqual(partShape2.isClockWise(index: 0), true)
        
        XCTAssertEqual(partShape0.points, [
            Point(x: -5, y: -10),
            Point(x: -5, y: -15),
            Point(x: -15, y: -15),
            Point(x: -15, y: -5),
            Point(x: -10, y: -5),
            Point(x: -10, y: -10)
            ].int
        )
        
        XCTAssertEqual(partShape1.points, [
            Point(x: -10, y: 0),
            Point(x: -15, y: 0),
            Point(x: -15, y: 5),
            Point(x: -10, y: 5)
            ].int
        )
        
        XCTAssertEqual(partShape2.points, [
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

private extension Array where Element == Point {
    var int: [IntPoint] {
        return IntGeom.defGeom.int(points: self)
    }
}
