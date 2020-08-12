//
//  EdgeTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 06.04.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper

final class EdgeTests: XCTestCase {
    
    func test_00() {
        let a = IntPoint(x: -1, y: 0)
        let b = IntPoint(x: 1, y: 0)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: a), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: b), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: .zero), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 0, y: 1)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 0, y: -1)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: -2, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 2, y: 0)), false)
    }
    
    func test_01() {
        let a = IntPoint(x: 1, y: 0)
        let b = IntPoint(x: -1, y: 0)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: a), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: b), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: .zero), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 0, y: 1)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 0, y: -1)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: -2, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 2, y: 0)), false)
    }
    
    func test_02() {
        let a = IntPoint(x: 0, y: -1)
        let b = IntPoint(x: 0, y: 1)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: a), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: b), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: .zero), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 1, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: -1, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 0, y: -2)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 0, y: 2)), false)
        
    }
    
    func test_03() {
        let a = IntPoint(x: 0, y: -1)
        let b = IntPoint(x: 0, y: 1)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: a), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: b), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: .zero), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 1, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: -1, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 0, y: -2)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 0, y: 2)), false)
    }
    
    func test_04() {
        let a = IntPoint(x: -1, y: -1)
        let b = IntPoint(x: 1, y: 1)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: a), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: b), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: .zero), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 1, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: -1, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: -2, y: -2)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 2, y: 2)), false)
    }
    
    func test_05() {
        let a = IntPoint(x: 1, y: 1)
        let b = IntPoint(x: -1, y: -1)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: a), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: b), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: .zero), true)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 1, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: -1, y: 0)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: -2, y: -2)), false)
        XCTAssertEqual(Edge.isContain(a: a, b: b, p: IntPoint(x: 2, y: 2)), false)
    }
}
