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
        let data = PinTestData.data[0]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
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
        let data = PinTestData.data[1]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
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
        let data = PinTestData.data[2]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]

        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)

        XCTAssertEqual(path.v0.slaveMileStone.index, 1)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 2)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v0.point, iSlave[1])
        XCTAssertEqual(path.v1.point, iSlave[2])
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_03() {
        let data = PinTestData.data[3]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]

        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)

        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v0.point, iSlave[2])
        XCTAssertEqual(path.v1.point, iSlave[1])
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_04() {
        let data = PinTestData.data[4]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 0)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)

        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iSlave[2])
        XCTAssertEqual(path.v1.point, iSlave[1])
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }

    func test_05() {
        let data = PinTestData.data[5]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]

        XCTAssertEqual(path.v0.masterMileStone.index, 3)
        XCTAssertEqual(path.v1.masterMileStone.index, 0)

        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        
        XCTAssertEqual(path.v0.point, iSlave[2])
        XCTAssertEqual(path.v1.point, iSlave[1])
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    func test_06() {
        let data = PinTestData.data[6]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        
        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v0.point, iSlave[2])
        XCTAssertEqual(path.v1.point, iSlave[1])
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    
    func test_07() {
        let data = PinTestData.data[7]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
                
        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)

        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 1)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v0.point, iSlave[2])
        XCTAssertEqual(path.v1.point, iSlave[1])
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 1)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points.count, 2)
    }
    
    func test_08() {
        let data = PinTestData.data[8]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 3)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)

        XCTAssertEqual(path.v0.slaveMileStone.index, 3)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)

        XCTAssertEqual(path.getTestLength(count: iMaster.count), 3)

        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: -10, y: 5), Point(x: -10, y: 10), Point(x: 10, y: 10), Point(x: 10, y: 5)])
    }
    
    
    func test_09() {
        let data = PinTestData.data[9]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 0)
        
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 3)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)

        XCTAssertEqual(path.getTestLength(count: iMaster.count), 3)

        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: -5, y: -10), Point(x: -10, y: -10), Point(x: -10, y: 10), Point(x: -5, y: 10)])
    }
    
    
    func test_10() {
        let data = PinTestData.data[10]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 3)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 3)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 10, y: -5), Point(x: 10, y: -10), Point(x: -10, y: -10), Point(x: -10, y: -5)])
    }
    
    
    func test_11() {
        let data = PinTestData.data[11]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 0)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)

        XCTAssertEqual(path.v0.slaveMileStone.index, 3)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 3)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 5, y: 10), Point(x: 10, y: 10), Point(x: 10, y: -10), Point(x: 5, y: -10)])
    }
    
    
    func test_12() {
        let data = PinTestData.data[12]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 0)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)
                
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)

        XCTAssertEqual(path.getTestLength(count: iMaster.count), 2)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 0, y: 10), Point(x: 10, y: 10), Point(x: 10, y: 0)])
    }
    
    
    func test_13() {
        let data = PinTestData.data[13]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 3)
        XCTAssertEqual(path.v1.masterMileStone.index, 0)
                
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)

        XCTAssertEqual(path.getTestLength(count: iMaster.count), 2)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: -10, y: 0), Point(x: -10, y: 10), Point(x: 0, y: 10)])
    }
    
    
    func test_14() {
        let data = PinTestData.data[14]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
                
        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)

        XCTAssertEqual(path.getTestLength(count: iMaster.count), 2)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 0, y: -10), Point(x: -10, y: -10), Point(x: -10, y: 0)])
    }
    
    
    func test_15() {
        let data = PinTestData.data[15]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)

        XCTAssertEqual(path.v0.slaveMileStone.index, 2)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 2)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 10, y: 0), Point(x: 10, y: -10), Point(x: 0, y: -10)])
    }
    
    
    func test_16() {
        let data = PinTestData.data[16]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let sequence = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(sequence.pinPathArray.count, 1)
        XCTAssertEqual(sequence.pinPointArray.count, 0)
        
        let path = sequence.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 1)
        XCTAssertEqual(path.v1.masterMileStone.index, 0)
                
        XCTAssertEqual(path.v0.slaveMileStone.index, 4)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)

        XCTAssertEqual(path.getTestLength(count: iMaster.count), 4)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 10, y: 0), Point(x: 10, y: -10), Point(x: -10, y: -10), Point(x: -10, y: 10), Point(x: 0, y: 10)])
    }
    
    
    func test_17() {
        let data = PinTestData.data[17]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 0)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 4)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.getTestLength(count: iMaster.count), 4)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 0, y: 10), Point(x: 10, y: 10), Point(x: 10, y: -10), Point(x: -10, y: -10), Point(x: -10, y: 0)])
    }
    
    
    func test_18() {
        let data = PinTestData.data[18]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        XCTAssertEqual(path.v0.masterMileStone.index, 3)
        XCTAssertEqual(path.v1.masterMileStone.index, 2)
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 4)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)

        XCTAssertEqual(path.getTestLength(count: iMaster.count), 4)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: -10, y: 0), Point(x: -10, y: 10), Point(x: 10, y: 10), Point(x: 10, y: -10), Point(x: 0, y: -10)])
    }
    
    
    func test_19() {
        let data = PinTestData.data[19]
        let iMaster = iGeom.int(points: data[0])
        let iSlave = iGeom.int(points: data[1])
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]

        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 1)
        
        XCTAssertEqual(path.v0.slaveMileStone.index, 4)
        XCTAssertEqual(path.v0.slaveMileStone.offset, 0)
        
        XCTAssertEqual(path.v1.slaveMileStone.index, 0)
        XCTAssertEqual(path.v1.slaveMileStone.offset, 0)

        XCTAssertEqual(path.getTestLength(count: iMaster.count), 4)
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 0, y: -10), Point(x: -10, y: -10), Point(x: -10, y: 10), Point(x: 10, y: 10), Point(x: 10, y: 0)])
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
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
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
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
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
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
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
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        let path = result.pinPathArray
        
        XCTAssertEqual(path.count, 1)
        
        let points_0 = iGeom.float(points: path[0].extract(points: iMaster))
        XCTAssertEqual(points_0, [Point(x: 0, y: -10), Point(x: -10, y: -10), Point(x: -10, y: 10)])
    }


    func test_24() {
        let iMaster = [
            IntPoint(x: -2, y: 2),
            IntPoint(x: 2, y: 2),
            IntPoint(x: 2, y: -2),
            IntPoint(x: -2, y: -2)
        ]
        
        let iSlave = [
            IntPoint(x: -4, y: 7),
            IntPoint(x: -4, y: -7),
            IntPoint(x: 3, y: -7),
            IntPoint(x: 1, y: 7)
        ]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        let path = result.pinPathArray[0]
        XCTAssertEqual(path.v0.point, IntPoint(x: 2, y: 2))
        XCTAssertEqual(path.v1.point, IntPoint(x: 2, y: 0))
    }
    
    
    func test_25() {
        let iMaster = [
            IntPoint(x: -2, y: 2),
            IntPoint(x: 2, y: 2),
            IntPoint(x: 2, y: -2),
            IntPoint(x: -2, y: -2)
        ]
        
        let iSlave = [
            IntPoint(x: -4, y: 7),
            IntPoint(x: -4, y: -7),
            IntPoint(x: 1, y: -7),
            IntPoint(x: 3, y: 7)
        ]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)

        XCTAssertEqual(result.pinPathArray.count, 1)
        let path = result.pinPathArray[0]
        XCTAssertEqual(path.v0.point, IntPoint(x: 2, y: 0))
        XCTAssertEqual(path.v1.point, IntPoint(x: 2, y: -2))
    }
 
    
    func test_26() {
        let iMaster = [
            IntPoint(x: -2, y: 2),
            IntPoint(x: 2, y: 2),
            IntPoint(x: 2, y: 0),
            IntPoint(x: -2, y: 0)
        ]
        
        let iSlave = [
            IntPoint(x: -4, y: 7),
            IntPoint(x: -4, y: -7),
            IntPoint(x: 3, y: -7),
            IntPoint(x: 1, y: 7)
        ]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        let path = result.pinPathArray[0]
        XCTAssertEqual(path.v0.point, IntPoint(x: 2, y: 2))
        XCTAssertEqual(path.v1.point, IntPoint(x: 2, y: 0))
    }

    
    func test_27() {
        let iMaster = [
            IntPoint(x: -2, y: 2),
            IntPoint(x: 2, y: 2),
            IntPoint(x: 2, y: 0),
            IntPoint(x: -2, y: 0)
        ]
        
        let iSlave = [
            IntPoint(x: -4, y: 4),
            IntPoint(x: -4, y: -4),
            IntPoint(x: 7, y: -4),
            IntPoint(x: 0, y: 4)
        ]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)

        let paths = result.pinPathArray
        XCTAssertEqual(paths.count, 0)
        
        let points = result.pinPointArray
        XCTAssertEqual(points.count, 1)
        
        
        XCTAssertEqual(IntPoint(x: 2, y: 2), points[0].point)
        XCTAssertEqual(PinPoint.PinType.in_out, points[0].type)
    }
    
    
    func test_28() {
        let iMaster = [
            IntPoint(x: -2, y: 2),
            IntPoint(x: 2, y: 2),
            IntPoint(x: 2, y: 0),
            IntPoint(x: -2, y: 0)
        ]
        
        let iSlave = [
            IntPoint(x: 0, y: 4),
            IntPoint(x: 7, y: -4),
            IntPoint(x: -4, y: -4),
            IntPoint(x: -4, y: 4),
        ]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)

        let paths = result.pinPathArray
        XCTAssertEqual(paths.count, 0)
        
        let points = result.pinPointArray
        XCTAssertEqual(points.count, 1)
        
        
        XCTAssertEqual(IntPoint(x: 2, y: 2), points[0].point)
        XCTAssertEqual(PinPoint.PinType.in_out, points[0].type)
    }

}
