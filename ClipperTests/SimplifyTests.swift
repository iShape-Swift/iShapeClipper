//
//  SimplifyTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 24.04.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper

//private extension Array where Element == IntPoint {
//
//    func log() {
//        print("        XCTAssertEqual(points, [")
//        for i in 0..<self.count {
//            let p = self[i]
//            if i + 1 != self.count {
//                print("            IntPoint(x: \(p.x), y: \(p.y)),")
//            } else {
//                print("            IntPoint(x: \(p.x), y: \(p.y))")
//            }
//        }
//        print("        ])")
//    }
//
//}

final class SimplifyTests: XCTestCase {

    
    func test_00() {
        // not_cross
        let data = SimplifyTestData.data[0]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, data.points)
    }
    
    func test_01() {
        // pure
        let data = SimplifyTestData.data[1]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: -100000, y: -100000),
            IntPoint(x: -100000, y: 100000),
            IntPoint(x: 0, y: 0)
        ])
    }
    
    func test_02() {
        // end_a0
        let data = SimplifyTestData.data[2]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: -100000, y: -100000),
            IntPoint(x: -150000, y: -150000)
        ])
    }
    
    func test_03() {
        // end_a1
        let data = SimplifyTestData.data[3]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: 0, y: -100000),
            IntPoint(x: 0, y: 100000),
            IntPoint(x: -100000, y: 100000)
        ])
    }
    
    func test_04() {
        // end_b0
        let data = SimplifyTestData.data[4]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: 0, y: -100000),
            IntPoint(x: 0, y: 0),
            IntPoint(x: -100000, y: 0)
        ])
    }
    
    func test_05() {
        // end_b1
        let data = SimplifyTestData.data[5]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: 0, y: -100000),
            IntPoint(x: 0, y: 0)
        ])
    }
    
    func test_06() {
        // end_a0_a1, same_line
        let data = SimplifyTestData.data[6]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: 0, y: -50000),
            IntPoint(x: 0, y: -100000)
        ])
    }
    
    func test_07() {
        // end_a0_b0
        let data = SimplifyTestData.data[7]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: -100000, y: -100000)
        ])
    }

    func test_08() {
        // end_a1_b0
        let data = SimplifyTestData.data[8]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: 0, y: -100000),
            IntPoint(x: 0, y: 100000),
            IntPoint(x: 100000, y: -100000)
        ])
    }

    func test_09() {
        // end_a1_b1
        let data = SimplifyTestData.data[9]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: 0, y: -100000),
            IntPoint(x: 0, y: 100000)
        ])
    }
    
    func test_10() {
        // end_b0_b1
        let data = SimplifyTestData.data[10]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: -100000, y: 0),
            IntPoint(x: 50000, y: 0)
        ])
    }

    func test_11() {
        // complex
        let data = SimplifyTestData.data[11]
        var points = data.points
        points.simplify()
        XCTAssertEqual(points, [
            IntPoint(x: -100000, y: -150000),
            IntPoint(x: -200000, y: -150000),
            IntPoint(x: -200000, y: -100000),
            IntPoint(x: -150000, y: -100000),
            IntPoint(x: -150000, y: -50000),
            IntPoint(x: -200000, y: -50000),
            IntPoint(x: -200000, y: 0),
            IntPoint(x: -150000, y: 0),
            IntPoint(x: -150000, y: 50000),
            IntPoint(x: -200000, y: 50000),
            IntPoint(x: -200000, y: 150000),
            IntPoint(x: 200000, y: 150000),
            IntPoint(x: 200000, y: 50000),
            IntPoint(x: 150000, y: 50000),
            IntPoint(x: 150000, y: 0),
            IntPoint(x: 200000, y: 0),
            IntPoint(x: 200000, y: -50000),
            IntPoint(x: 150000, y: -50000),
            IntPoint(x: 150000, y: -100000),
            IntPoint(x: 200000, y: -100000),
            IntPoint(x: 200000, y: -150000),
            IntPoint(x: 100000, y: -150000)
        ])
    }
    
}
