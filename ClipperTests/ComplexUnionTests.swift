//
//  ComplexUnionTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 06.06.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper

final class ComplexUnionTests: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func test_00() {
        let data = ComplexTestData.data[0]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .notOverlap)
    }
    
    func test_01() {
        let data = ComplexTestData.data[1]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .masterIncludeSlave)
    }
    
    func test_02() {
        let data = ComplexTestData.data[2]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 6, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -15.0, y: 15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: 5.0, y: 10.0),
            Point(x: -10.0, y: 10.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -5.0, y: -5.0),
            Point(x: -5.0, y: 5.0),
            Point(x: 5.0, y: 5.0)

            ].int
        )

    }

    func test_03() {
        let data = ComplexTestData.data[3]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -15.0, y: 10.0),
            Point(x: 15.0, y: 10.0),
            Point(x: 15.0, y: -10.0),
            Point(x: -15.0, y: -10.0),
            Point(x: -10.0, y: 5.0),
            Point(x: -10.0, y: 0.0),
            Point(x: -5.0, y: 0.0),
            Point(x: -5.0, y: 5.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 5.0, y: 0.0),
            Point(x: 5.0, y: -5.0)
            ].int
        )
    }
    
    func test_04() {
        let data = ComplexTestData.data[4]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 20, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        XCTAssertEqual(mainShape.isClockWise(index: 4), false)
        XCTAssertEqual(mainShape.isClockWise(index: 5), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -30.0, y: 35.0),
            Point(x: 30.0, y: 35.0),
            Point(x: 30.0, y: -35.0),
            Point(x: -30.0, y: -35.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 10.0, y: 5.0),
            Point(x: -10.0, y: 5.0),
            Point(x: -10.0, y: 0.0),
            Point(x: 10.0, y: -20.0),
            Point(x: 10.0, y: -15.0),
            Point(x: -10.0, y: -15.0),
            Point(x: -10.0, y: -20.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 10.0),
            Point(x: 5.0, y: 10.0),
            Point(x: 5.0, y: 15.0),
            Point(x: -5.0, y: -5.0),
            Point(x: -5.0, y: -10.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -5.0, y: -25.0),
            Point(x: -5.0, y: -30.0),
            Point(x: 5.0, y: -30.0),
            Point(x: 5.0, y: -25.0)
            ].int
        )
    }

    func test_05() {
        let data = ComplexTestData.data[5]
        
        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 20, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        XCTAssertEqual(mainShape.isClockWise(index: 4), false)
        XCTAssertEqual(mainShape.isClockWise(index: 5), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -30.0, y: 35.0),
            Point(x: 30.0, y: 35.0),
            Point(x: 30.0, y: -40.0),
            Point(x: -30.0, y: -40.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 10.0),
            Point(x: 0.0, y: 10.0),
            Point(x: 0.0, y: 15.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 5.0),
            Point(x: -10.0, y: 5.0),
            Point(x: -10.0, y: 0.0),
            Point(x: -5.0, y: -5.0),
            Point(x: -5.0, y: -10.0),
            Point(x: 0.0, y: -10.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 0.0, y: -20.0),
            Point(x: 0.0, y: -15.0),
            Point(x: -10.0, y: -15.0),
            Point(x: -10.0, y: -20.0),
            Point(x: -5.0, y: -25.0),
            Point(x: -5.0, y: -30.0),
            Point(x: 0.0, y: -30.0),
            Point(x: 0.0, y: -25.0)
            ].int
        )
    }
    
    func test_06() {
        let data = ComplexTestData.data[6]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .slaveIncludeMaster)
    }
    
    func test_07() {
        let data = ComplexTestData.data[7]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .equal)
    }
    
    func test_08() {
        let data = ComplexTestData.data[8]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .slaveIncludeMaster)
    }

    
    func test_09() {
        let data = ComplexTestData.data[9]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -5.0, y: 10.0),
            Point(x: -5.0, y: 15.0),
            Point(x: 5.0, y: 15.0),
            Point(x: 5.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0),
            Point(x: -10.0, y: 10.0)

            ].int
        )
    }

    func test_10() {
        let data = ComplexTestData.data[10]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -5.0, y: 0.0),
            Point(x: -10.0, y: 0.0),
            Point(x: -10.0, y: 5.0),
            Point(x: -5.0, y: 5.0),
            Point(x: -5.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -15.0),
            Point(x: -5.0, y: -15.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 0.0, y: -10.0)
            ].int
        )
    }

    func test_11() {
        let data = ComplexTestData.data[11]
        
        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 12, isClockWise: true),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -5.0, y: 0.0),
            Point(x: -10.0, y: 0.0),
            Point(x: -10.0, y: 5.0),
            Point(x: -5.0, y: 5.0),
            Point(x: -5.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: 5.0),
            Point(x: 15.0, y: 5.0),
            Point(x: 15.0, y: 0.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 10.0, y: -15.0),
            Point(x: -5.0, y: -15.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 0.0, y: -10.0)
            ].int
        )
    }

    func test_12() {
        let data = ComplexTestData.data[12]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 20, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 24, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        XCTAssertEqual(mainShape.isClockWise(index: 4), false)
        XCTAssertEqual(mainShape.isClockWise(index: 5), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: 20.0, y: 20.0),
            Point(x: 25.0, y: 20.0),
            Point(x: 25.0, y: -15.0),
            Point(x: 20.0, y: -15.0),
            Point(x: 20.0, y: -25.0),
            Point(x: -20.0, y: -25.0),
            Point(x: -20.0, y: 30.0),
            Point(x: 20.0, y: 30.0),
            Point(x: -15.0, y: 15.0),
            Point(x: -15.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: 15.0),
            Point(x: -15.0, y: -5.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: -5.0),
            Point(x: -5.0, y: 25.0),
            Point(x: -5.0, y: 20.0),
            Point(x: 5.0, y: 20.0),
            Point(x: 5.0, y: 25.0),
            Point(x: -5.0, y: 5.0),
            Point(x: -5.0, y: 0.0),
            Point(x: 5.0, y: 0.0),
            Point(x: 5.0, y: 5.0),
            Point(x: -5.0, y: -15.0),
            Point(x: -5.0, y: -20.0),
            Point(x: 5.0, y: -20.0),
            Point(x: 5.0, y: -15.0)
            ].int
        )
    }

    func test_13() {
        let data = ComplexTestData.data[13]
        
        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 12, isClockWise: true),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 20, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: 20.0, y: 10.0),
            Point(x: 25.0, y: 10.0),
            Point(x: 25.0, y: -10.0),
            Point(x: 20.0, y: -10.0),
            Point(x: 20.0, y: -25.0),
            Point(x: -20.0, y: -25.0),
            Point(x: -20.0, y: -10.0),
            Point(x: -25.0, y: -10.0),
            Point(x: -25.0, y: 10.0),
            Point(x: -20.0, y: 10.0),
            Point(x: -20.0, y: 30.0),
            Point(x: 20.0, y: 30.0),
            Point(x: -5.0, y: 25.0),
            Point(x: -5.0, y: 20.0),
            Point(x: 5.0, y: 20.0),
            Point(x: 5.0, y: 25.0),
            Point(x: -15.0, y: 15.0),
            Point(x: -15.0, y: 10.0),
            Point(x: 15.0, y: 10.0),
            Point(x: 15.0, y: 15.0),
            Point(x: -5.0, y: -15.0),
            Point(x: -5.0, y: -20.0),
            Point(x: 5.0, y: -20.0),
            Point(x: 5.0, y: -15.0)
            ].int
        )
    }

    func test_14() {
        let data = ComplexTestData.data[14]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 3, isClockWise: false),
            PlainShape.Layout(begin: 11, length: 3, isClockWise: false),
            PlainShape.Layout(begin: 14, length: 5, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        
        XCTAssertEqual(mainShape.points, [
            IntPoint(x: 200000, y: 171311),
            IntPoint(x: 250000, y: 200000),
            IntPoint(x: 250000, y: -150000),
            IntPoint(x: 200000, y: -121311),
            IntPoint(x: 200000, y: -150000),
            IntPoint(x: -200000, y: -150000),
            IntPoint(x: -200000, y: 200000),
            IntPoint(x: 200000, y: 200000),
            IntPoint(x: -50000, y: 0),
            IntPoint(x: -11429, y: 0),
            IntPoint(x: -50000, y: 22131),
            IntPoint(x: -50000, y: 50000),
            IntPoint(x: -50000, y: 27869),
            IntPoint(x: -11429, y: 50000),
            IntPoint(x: -150000, y: -50000),
            IntPoint(x: -150000, y: -100000),
            IntPoint(x: 150000, y: -100000),
            IntPoint(x: 150000, y: -92623),
            IntPoint(x: 75714, y: -50000)
            ]
        )
    }

    func test_15() {
        let data = ComplexTestData.data[15]
        
        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 7, isClockWise: true),
            PlainShape.Layout(begin: 7, length: 3, isClockWise: false),
            PlainShape.Layout(begin: 10, length: 3, isClockWise: false),
            PlainShape.Layout(begin: 13, length: 3, isClockWise: false),
            PlainShape.Layout(begin: 16, length: 3, isClockWise: false),
            PlainShape.Layout(begin: 19, length: 5, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        XCTAssertEqual(mainShape.isClockWise(index: 4), false)
        XCTAssertEqual(mainShape.isClockWise(index: 5), false)
        
        XCTAssertEqual(mainShape.points, [
            IntPoint(x: 200000, y: -110000),
            IntPoint(x: 250000, y: -150000),
            IntPoint(x: 200000, y: -121311),
            IntPoint(x: 200000, y: -150000),
            IntPoint(x: -200000, y: -150000),
            IntPoint(x: -200000, y: 200000),
            IntPoint(x: 200000, y: 200000),
            IntPoint(x: 50000, y: 50000),
            IntPoint(x: 0, y: 50000),
            IntPoint(x: 50000, y: 10000),
            IntPoint(x: -50000, y: 0),
            IntPoint(x: -11429, y: 0),
            IntPoint(x: -50000, y: 22131),
            IntPoint(x: -50000, y: 50000),
            IntPoint(x: -50000, y: 27273),
            IntPoint(x: 0, y: 50000),
            IntPoint(x: 150000, y: -50000),
            IntPoint(x: 125000, y: -50000),
            IntPoint(x: 150000, y: -70000),
            IntPoint(x: -150000, y: -50000),
            IntPoint(x: -150000, y: -100000),
            IntPoint(x: 150000, y: -100000),
            IntPoint(x: 150000, y: -92623),
            IntPoint(x: 75714, y: -50000)
            ]
        )
    }
    
    func test_16() {
        let data = ComplexTestData.data[16]
        
        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList

        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 16, isClockWise: true),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: 5.0, y: -10.0),
            Point(x: 5.0, y: -15.0),
            Point(x: 0.0, y: -15.0),
            Point(x: 0.0, y: -10.0),
            Point(x: -10.0, y: -10.0),
            Point(x: -10.0, y: 10.0),
            Point(x: 0.0, y: 10.0),
            Point(x: 0.0, y: 15.0),
            Point(x: 5.0, y: 15.0),
            Point(x: 5.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: 5.0),
            Point(x: 5.0, y: 5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 0.0, y: 5.0),
            Point(x: -5.0, y: 5.0),
            Point(x: -5.0, y: -5.0)
            ].int
        )
    }

    func test_17() {
        let data = ComplexTestData.data[17]
        
        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList

        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: 5.0, y: 5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: -20.0),
            Point(x: -10.0, y: -20.0),
            Point(x: -10.0, y: 20.0),
            Point(x: 10.0, y: 20.0),
            Point(x: 10.0, y: 5.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 0.0, y: 5.0),
            Point(x: -5.0, y: 5.0),
            Point(x: -5.0, y: -5.0)
            ].int
        )
    }

    func test_18() {
        let data = ComplexTestData.data[18]
        
        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 8, isClockWise: true),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: 15.0, y: 5.0),
            Point(x: 15.0, y: -5.0),
            Point(x: 20.0, y: -5.0),
            Point(x: 20.0, y: -25.0),
            Point(x: -10.0, y: -25.0),
            Point(x: -10.0, y: 25.0),
            Point(x: 20.0, y: 25.0),
            Point(x: 20.0, y: 5.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 0.0, y: 5.0),
            Point(x: -5.0, y: 5.0),
            Point(x: -5.0, y: -5.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 10.0),
            Point(x: 0.0, y: 10.0),
            Point(x: 0.0, y: 15.0)
            ].int
        )
    }

    func test_19() {
        let data = ComplexTestData.data[19]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 12, isClockWise: false),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -25.0, y: 20.0),
            Point(x: 25.0, y: 20.0),
            Point(x: 25.0, y: -20.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: 5.0),
            Point(x: 20.0, y: 15.0),
            Point(x: -20.0, y: 15.0),
            Point(x: -20.0, y: 5.0),
            Point(x: -15.0, y: 5.0),
            Point(x: -15.0, y: 10.0),
            Point(x: -10.0, y: 10.0),
            Point(x: -10.0, y: 5.0),
            Point(x: 10.0, y: 5.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 15.0, y: 10.0),
            Point(x: 15.0, y: 5.0),
            Point(x: -5.0, y: 0.0),
            Point(x: -5.0, y: -5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 5.0, y: 0.0)
            ].int
        )
    }

    func test_20() {
        let data = ComplexTestData.data[20]
        
        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        XCTAssertEqual(mainShape.isClockWise(index: 4), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -25.0, y: 30.0),
            Point(x: 25.0, y: 30.0),
            Point(x: 25.0, y: -30.0),
            Point(x: -25.0, y: -30.0),
            Point(x: 20.0, y: -5.0),
            Point(x: 20.0, y: 5.0),
            Point(x: -10.0, y: 5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -20.0, y: 5.0),
            Point(x: -20.0, y: -5.0),
            Point(x: -15.0, y: -5.0),
            Point(x: -15.0, y: 5.0),
            Point(x: -5.0, y: -10.0),
            Point(x: -5.0, y: -15.0),
            Point(x: 5.0, y: -15.0),
            Point(x: 5.0, y: -10.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 10.0),
            Point(x: 5.0, y: 10.0),
            Point(x: 5.0, y: 15.0)
            ].int
        )
    }
    
    func test_21() {
        let data = ComplexTestData.data[21]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -15.0, y: 10.0),
            Point(x: 15.0, y: 10.0),
            Point(x: 15.0, y: -10.0),
            Point(x: -15.0, y: -10.0)
            ].int
        )
    }

    func test_22() {
        let data = ComplexTestData.data[22]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 12, length: 12, isClockWise: false),
            PlainShape.Layout(begin: 24, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 28, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 32, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        XCTAssertEqual(mainShape.isClockWise(index: 4), false)
        XCTAssertEqual(mainShape.isClockWise(index: 5), false)
        XCTAssertEqual(mainShape.isClockWise(index: 6), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -25.0, y: 20.0),
            Point(x: 25.0, y: 20.0),
            Point(x: 25.0, y: -20.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: -5.0),
            Point(x: 20.0, y: 0.0),
            Point(x: 15.0, y: 0.0),
            Point(x: 15.0, y: -5.0),
            Point(x: 20.0, y: -15.0),
            Point(x: 20.0, y: -10.0),
            Point(x: 15.0, y: -10.0),
            Point(x: 15.0, y: -15.0),
            Point(x: 20.0, y: 5.0),
            Point(x: 20.0, y: 15.0),
            Point(x: -20.0, y: 15.0),
            Point(x: -20.0, y: 5.0),
            Point(x: -15.0, y: 5.0),
            Point(x: -15.0, y: 10.0),
            Point(x: -10.0, y: 10.0),
            Point(x: -10.0, y: 5.0),
            Point(x: 10.0, y: 5.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 15.0, y: 10.0),
            Point(x: 15.0, y: 5.0),
            Point(x: -20.0, y: 0.0),
            Point(x: -20.0, y: -5.0),
            Point(x: -15.0, y: -5.0),
            Point(x: -15.0, y: 0.0),
            Point(x: -20.0, y: -10.0),
            Point(x: -20.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: -15.0, y: -10.0),
            Point(x: -5.0, y: 0.0),
            Point(x: -5.0, y: -5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 5.0, y: 0.0)
            ].int
        )
    }
    
    func test_23() {
        let data = ComplexTestData.data[23]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 8, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 12, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 20, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 24, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        XCTAssertEqual(mainShape.isClockWise(index: 4), false)
        XCTAssertEqual(mainShape.isClockWise(index: 5), false)
        XCTAssertEqual(mainShape.isClockWise(index: 6), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -25.0, y: 30.0),
            Point(x: 25.0, y: 30.0),
            Point(x: 25.0, y: -30.0),
            Point(x: -25.0, y: -30.0),
            Point(x: 20.0, y: -5.0),
            Point(x: 20.0, y: 5.0),
            Point(x: -10.0, y: 5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -20.0, y: 5.0),
            Point(x: -20.0, y: -5.0),
            Point(x: -15.0, y: -5.0),
            Point(x: -15.0, y: 5.0),
            Point(x: 20.0, y: -15.0),
            Point(x: 20.0, y: -10.0),
            Point(x: 15.0, y: -10.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -20.0, y: 15.0),
            Point(x: -20.0, y: 10.0),
            Point(x: -15.0, y: 10.0),
            Point(x: -15.0, y: 15.0),
            Point(x: -5.0, y: -10.0),
            Point(x: -5.0, y: -15.0),
            Point(x: 5.0, y: -15.0),
            Point(x: 5.0, y: -10.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 10.0),
            Point(x: 5.0, y: 10.0),
            Point(x: 5.0, y: 15.0)
            ].int
        )
    }
    
    func test_24() {
        let data = ComplexTestData.data[24]

        let solution = data.shape.complexUnion(path: data.invertPath)

        XCTAssertEqual(solution.nature, .overlap)
        
        let mainShape = solution.pathList
        
        XCTAssertEqual(mainShape.layouts, [
            PlainShape.Layout(begin: 0, length: 4, isClockWise: true),
            PlainShape.Layout(begin: 4, length: 12, isClockWise: false),
            PlainShape.Layout(begin: 16, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 20, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 24, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 28, length: 4, isClockWise: false),
            PlainShape.Layout(begin: 32, length: 4, isClockWise: false)
        ])
        
        XCTAssertEqual(mainShape.isClockWise(index: 0), true)
        XCTAssertEqual(mainShape.isClockWise(index: 1), false)
        XCTAssertEqual(mainShape.isClockWise(index: 2), false)
        XCTAssertEqual(mainShape.isClockWise(index: 3), false)
        XCTAssertEqual(mainShape.isClockWise(index: 4), false)
        
        XCTAssertEqual(mainShape.points, [
            Point(x: -25.0, y: 20.0),
            Point(x: 25.0, y: 20.0),
            Point(x: 25.0, y: -20.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: 5.0),
            Point(x: 20.0, y: 15.0),
            Point(x: -20.0, y: 15.0),
            Point(x: -20.0, y: 5.0),
            Point(x: -15.0, y: 5.0),
            Point(x: -15.0, y: 10.0),
            Point(x: -10.0, y: 10.0),
            Point(x: -10.0, y: 5.0),
            Point(x: 10.0, y: 5.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 15.0, y: 10.0),
            Point(x: 15.0, y: 5.0),
            Point(x: -5.0, y: -5.0),
            Point(x: -5.0, y: 0.0),
            Point(x: -10.0, y: 0.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -20.0, y: 0.0),
            Point(x: -20.0, y: -5.0),
            Point(x: -15.0, y: -5.0),
            Point(x: -15.0, y: 0.0),
            Point(x: 5.0, y: -7.5),
            Point(x: -5.0, y: -7.5),
            Point(x: -5.0, y: -10.0),
            Point(x: 5.0, y: -10.0),
            Point(x: -5.0, y: -17.5),
            Point(x: 5.0, y: -17.5),
            Point(x: 5.0, y: -15.0),
            Point(x: -5.0, y: -15.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 5.0, y: 0.0)
            ].int
        )
    }
}

private extension Array where Element == Point {
    var int: [IntPoint] {
        return IntGeom.defGeom.int(points: self)
    }
}

private extension PlainShape {

    func log() {
        print("        XCTAssertEqual(mainShape.points, [")
        for i in 0..<self.points.count {
            let p = self.points[i]
            if i + 1 != self.points.count {
                print("            Point(x: \(p.X), y: \(p.Y)),")
            } else {
                print("            Point(x: \(p.X), y: \(p.Y))")
            }
        }
        print("        ])")
    }
    
    func iLog() {
        print("        XCTAssertEqual(mainShape.points, [")
        for i in 0..<self.points.count {
            let p = self.points[i]
            if i + 1 != self.points.count {
                print("            IntPoint(x: \(p.x), y: \(p.y)),")
            } else {
                print("            IntPoint(x: \(p.x), y: \(p.y))")
            }
        }
        print("        ])")
    }

}
