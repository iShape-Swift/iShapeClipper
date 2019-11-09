//
//  PinPathTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 05/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper

final class PinPathTests: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func test_00() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))

        let iMaster = iGeom.int(points: master)
        
        var slave = [Point]()
        
        slave.append(Point(x: 0, y: 0))
        slave.append(Point(x: 5, y: 10))
        slave.append(Point(x: -5, y: 10))
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        let z = iGeom.int(point: Point(x: -10, y: 10))
        
        XCTAssertEqual(path.v0.masterMileStone.index, 0)
        XCTAssertEqual(path.v0.masterMileStone.offset, z.sqrDistance(point: path.v0.point))
        
        XCTAssertEqual(path.v1.masterMileStone.index, 0)
        XCTAssertEqual(path.v1.masterMileStone.offset, z.sqrDistance(point: path.v1.point))

        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)

        XCTAssertEqual(path.v0.point, iGeom.int(point: Point(x: -5, y: 10)))
        XCTAssertEqual(path.v1.point, iGeom.int(point: Point(x: 5, y: 10)))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_01() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        let iMaster = iGeom.int(points: master)
        
        var slave = [Point]()
        slave.append(Point(x: 0, y: 0))
        slave.append(Point(x: -10, y: 5))
        slave.append(Point(x: -10, y: -5))
        
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        
        XCTAssertEqual(path.v0.masterMileStone.index, 3)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: Point(x: -10, y: -5)))
        XCTAssertEqual(path.v1.point, iGeom.int(point: Point(x: -10, y: 5)))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_02() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: -5, y: -10)
        let pt1 = Point(x: 5, y: -10)
        
        var slave = [Point]()
        slave.append(Point(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        
        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_03() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 10, y: -5)
        let pt1 = Point(x: 10, y: 5)
        
        var slave = [Point]()
        slave.append(Point(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        
        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_04() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 10, y: 10)
        let pt1 = Point(x: -10, y: 10)
        
        var slave = [Point]()
        slave.append(Point(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 0)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_05() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        let iMaster = iGeom.int(points: master)
        
        
        let pt0 = Point(x: -10, y: 10)
        let pt1 = Point(x: -10, y: -10)
        
        var slave = [Point]()
        slave.append(Point(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        
        XCTAssertEqual(path.v0.masterMileStone.index, 3)
        XCTAssertEqual(path.v1.masterMileStone.index, 0)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_06() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: -10, y: -10)
        let pt1 = Point(x: 10, y: -10)
        
        var slave = [Point]()
        slave.append(Point(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        
        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_07() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 10, y: -10)
        let pt1 = Point(x: 10, y: 10)
        
        var slave = [Point]()
        slave.append(Point(x: 0, y: 0))
        slave.append(pt0)
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        
        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    func test_08() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 10, y: 5)
        let pt1 = Point(x: -10, y: 5)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: 10, y: 10))
        slave.append(Point(x: -10, y: 10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 3)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 3)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 3)
        

        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [pt1, Point(x: -10, y: 10), Point(x: 10, y: 10), pt0])
    }
    
    
    func test_09() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: -5, y: 10)
        let pt1 = Point(x: -5, y: -10)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: -10, y: 10))
        slave.append(Point(x: -10, y: -10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 0)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 3)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 3)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [pt1, Point(x: -10, y: -10), Point(x: -10, y: 10), pt0])
    }
    
    
    func test_10() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: -10, y: -5)
        let pt1 = Point(x: 10, y: -5)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: -10, y: -10))
        slave.append(Point(x: 10, y: -10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 3)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 3)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [pt1, Point(x: 10, y: -10), Point(x: -10, y: -10), pt0])
    }
    
    
    func test_11() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 5, y: -10)
        let pt1 = Point(x: 5, y: 10)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: 10, y: -10))
        slave.append(Point(x: 10, y: 10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 0)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 3)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 3)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [pt1, Point(x: 10, y: 10), Point(x: 10, y: -10), pt0])
    }
    
    
    func test_12() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 10, y: 0)
        let pt1 = Point(x: 0, y: 10)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: 10, y: 10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 0)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 2)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [pt1, Point(x: 10, y: 10), pt0])
    }
    
    
    func test_13() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 0, y: 10)
        let pt1 = Point(x: -10, y: 0)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: -10, y: 10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 3)
        XCTAssertEqual(path.v1.masterMileStone.index, 0)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 2)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [pt1, Point(x: -10, y: 10), pt0])
    }
    
    
    func test_14() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: -10, y: 0)
        let pt1 = Point(x: 0, y: -10)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: -10, y: -10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 2)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [pt1, Point(x: -10, y: -10), pt0])
    }
    
    
    func test_15() {
        
        var master = [Point]()
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 0, y: -10)
        let pt1 = Point(x: 10, y: 0)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: 10, y: -10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 2)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [pt1, Point(x: 10, y: -10), pt0])
    }
    
    
    func test_16() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 0, y: 10)
        let pt1 = Point(x: 10, y: 0)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: -10, y: 10))
        slave.append(Point(x: -10, y: -10))
        slave.append(Point(x: 10, y: -10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let sequence = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(sequence.pinPathArray.count, 1)
        XCTAssertEqual(sequence.pinPointArray.count, 0)
        
        let path = sequence.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 0)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 4)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 4)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, slave.reversed())
    }
    
    
    func test_17() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: -10, y: 0)
        let pt1 = Point(x: 0, y: 10)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: -10, y: -10))
        slave.append(Point(x: 10, y: -10))
        slave.append(Point(x: 10, y: 10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 0)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 4)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 4)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, slave.reversed())
    }
    
    
    func test_18() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 0, y: -10)
        let pt1 = Point(x: -10, y: 0)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: 10, y: -10))
        slave.append(Point(x: 10, y: 10))
        slave.append(Point(x: -10, y: 10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 3)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 4)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 4)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, slave.reversed())
    }
    
    
    func test_19() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        let pt0 = Point(x: 10, y: 0)
        let pt1 = Point(x: 0, y: -10)
        
        var slave = [Point]()
        slave.append(pt0)
        slave.append(Point(x: 10, y: 10))
        slave.append(Point(x: -10, y: 10))
        slave.append(Point(x: -10, y: -10))
        slave.append(pt1)
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        
        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 4)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iGeom.int(point: pt1))
        XCTAssertEqual(path.v1.point, iGeom.int(point: pt0))
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 4)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, slave.reversed())
    }
    
    
    func test_20() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        var slave = [Point]()
        slave.append(Point(x: 10, y: 5))
        slave.append(Point(x: 5, y: 10))
        slave.append(Point(x: -5, y: 10))
        slave.append(Point(x: -10, y: 5))
        slave.append(Point(x: -10, y: -5))
        slave.append(Point(x: -5, y: -10))
        slave.append(Point(x: 5, y: -10))
        slave.append(Point(x: 10, y: -5))
        
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 4)
        
        let points_0 = iGeom.float(points: path[0].extract(points: iMaster))
        XCTAssertEqual(points_0, [Point(x: -5, y: 10), Point(x: 5, y: 10)])
        
        let points_1 = iGeom.float(points: path[1].extract(points: iMaster))
        XCTAssertEqual(points_1, [Point(x: 10, y: 5), Point(x: 10, y: -5)])
        
        let points_2 = iGeom.float(points: path[2].extract(points: iMaster))
        XCTAssertEqual(points_2, [Point(x: 5, y: -10), Point(x: -5, y: -10)])
        
        let points_3 = iGeom.float(points: path[3].extract(points: iMaster))
        XCTAssertEqual(points_3, [Point(x: -10, y: -5), Point(x: -10, y: 5)])
    }
    
    
    func test_21() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        var slave = [Point]()
        slave.append(Point(x: 10, y: 5))
        slave.append(Point(x: 10, y: 10))
        slave.append(Point(x: 5, y: 10))
        slave.append(Point(x: 0, y: 5))
        slave.append(Point(x: -5, y: 10))
        
        slave.append(Point(x: -10, y: 10))
        slave.append(Point(x: -10, y: 5))
        slave.append(Point(x: -5, y: 0))
        slave.append(Point(x: -10, y: -5))
        slave.append(Point(x: -10, y: -10))
        
        slave.append(Point(x: -5, y: -10))
        slave.append(Point(x: 0, y: -5))
        slave.append(Point(x: 5, y: -10))
        slave.append(Point(x: 10, y: -10))
        slave.append(Point(x: 10, y: -5))
        slave.append(Point(x: 5, y: 0))
        
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 4)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let points_0 = iGeom.float(points: path[0].extract(points: iMaster))
        XCTAssertEqual(points_0, [Point(x: 5, y: 10), Point(x: 10, y: 10), Point(x: 10, y: 5)])
        
        let points_1 = iGeom.float(points: path[1].extract(points: iMaster))
        XCTAssertEqual(points_1, [Point(x: 10, y: -5), Point(x: 10, y: -10), Point(x: 5, y: -10)])
        
        let points_2 = iGeom.float(points: path[2].extract(points: iMaster))
        XCTAssertEqual(points_2, [Point(x: -5, y: -10), Point(x: -10, y: -10), Point(x: -10, y: -5)])
        
        let points_3 = iGeom.float(points: path[3].extract(points: iMaster))
        XCTAssertEqual(points_3, [Point(x: -10, y: 5), Point(x: -10, y: 10), Point(x: -5, y: 10)])
    }
    
    
    
    func test_22() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: -10))
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        var slave = [Point]()
        slave.append(Point(x: -10, y: 5))
        slave.append(Point(x: -10, y: 0))
        slave.append(Point(x: -15, y: 0))
        slave.append(Point(x: -10, y: -5))
        slave.append(Point(x: -10, y: -10))
        slave.append(Point(x: -5, y: -10))
        slave.append(Point(x: 0, y: -5))
        slave.append(Point(x: 0, y: -10))
        slave.append(Point(x: 5, y: -10))
        slave.append(Point(x: 5, y: -5))
        slave.append(Point(x: 0, y: 0))
        slave.append(Point(x: -5, y: 0))
        
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 4)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let points_0 = iGeom.float(points: path[0].extract(points: iMaster))
        XCTAssertEqual(points_0, [Point(x: -10, y: 0), Point(x: -10, y: 5)])
        
        let points_1 = iGeom.float(points: path[1].extract(points: iMaster))
        XCTAssertEqual(points_1, [Point(x: 0, y: 0), Point(x: 5, y: -5)])
        
        let points_2 = iGeom.float(points: path[2].extract(points: iMaster))
        XCTAssertEqual(points_2, [Point(x: 5, y: -10), Point(x: 0, y: -10)])
        
    }
    
    
    func test_23() {
        
        var master = [Point]()
        
        master.append(Point(x: -10, y: 10))
        master.append(Point(x: 10, y: 10))
        master.append(Point(x: 10, y: -10))
        master.append(Point(x: -10, y: -10))
        
        let iMaster = iGeom.int(points: master)
        
        var slave = [Point]()
        slave.append(Point(x: 10, y: 0))
        slave.append(Point(x: 0, y: -10))
        slave.append(Point(x: -10, y: -10))
        slave.append(Point(x: -10, y: 10))
        
        let iSlave = iGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let points_0 = iGeom.float(points: path[0].extract(points: iMaster))
        XCTAssertEqual(points_0, [Point(x: 0, y: -10), Point(x: -10, y: -10), Point(x: -10, y: 10)])
    }
    
    
}
