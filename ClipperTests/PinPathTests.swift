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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]

        XCTAssertEqual(path.v0.masterMileStone.index, 2)
        XCTAssertEqual(path.v1.masterMileStone.index, 3)
        
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
    
    
    func test_07() {
        let data = PinTestData.data[7]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let sequence = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
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
        let data = PinTestData.data[20]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: -10, y: 10), Point(x: -5, y: 10)])
    }
    
    func test_21() {
        let data = PinTestData.data[21]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 1)
        
        let path = result.pinPathArray[0]
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: -10, y: 10), Point(x: -5, y: 10)])
    }
    
    func test_22() {
        let data = PinTestData.data[22]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 5, y: 10), Point(x: 10, y: 10)])
    }
    
    func test_23() {
        let data = PinTestData.data[23]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 1)
        
        let path = result.pinPathArray[0]
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 5, y: 10), Point(x: 10, y: 10)])
    }
    
    func test_24() {
        let data = PinTestData.data[24]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: -10, y: 10), Point(x: 10, y: 10)])
    }
    
    func test_25() {
        let data = PinTestData.data[25]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 2)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path0 = result.pinPathArray[0]
        
        let points0 = iGeom.float(points: path0.extract(points: iMaster))
        XCTAssertEqual(points0, [Point(x: -5, y: 10), Point(x: 5, y: 10)])
        
        let path1 = result.pinPathArray[1]
        
        let points1 = iGeom.float(points: path1.extract(points: iMaster))
        XCTAssertEqual(points1, [Point(x: 5, y: -10), Point(x: -5, y: -10)])
    }
    
    func test_26() {
        let data = PinTestData.data[26]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: -10, y: 0), Point(x: -10, y: 10)])
    }
    
    func test_27() {
        let data = PinTestData.data[27]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 10, y: 10), Point(x: 10, y: 0)])
    }
    
    func test_28() {
        let data = PinTestData.data[28]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        XCTAssertEqual(result.pinPointArray.count, 0)
        
        let path = result.pinPathArray[0]
        
        let points = iGeom.float(points: path.extract(points: iMaster))
        XCTAssertEqual(points, [Point(x: 10, y: 10), Point(x: 10, y: 0)])
    }
    
    func test_29() {
        let data = PinTestData.data[29]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        
        let path = result.pinPathArray[0]
        XCTAssertEqual(path.v0.type, .in_out)
        XCTAssertEqual(path.v1.type, .in_out)
    }
    
    func test_30() {
        let data = PinTestData.data[30]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        
        let path = result.pinPathArray[0]
        XCTAssertEqual(path.v0.type, .out_in)
        XCTAssertEqual(path.v1.type, .out_in)
    }
    
    func test_31() {
        let data = PinTestData.data[31]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        
        let path = result.pinPathArray[0]
        XCTAssertEqual(path.v0.type, .out_in)
        XCTAssertEqual(path.v1.type, .out_in)
    }
    
    func test_32() {
        let data = PinTestData.data[32]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)

        XCTAssertEqual(result.pinPointArray.count, 2)
        
        let p0 = result.pinPointArray[0]
        let p1 = result.pinPointArray[1]

        XCTAssertEqual(p0.type, .outside)
        XCTAssertEqual(p1.type, .inside)
    }
    
    func test_33() {
        let data = PinTestData.data[33]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)

        XCTAssertEqual(result.pinPointArray.count, 4)
        XCTAssertEqual(result.pinPathArray.count, 2)
        
        let path0 = result.pinPathArray[0]
        let path1 = result.pinPathArray[1]

        XCTAssertEqual(path0.v0.type, .in_out)
        XCTAssertEqual(path1.v0.type, .in_out)
    }
    
    
    func test_34() {
        let data = PinTestData.data[34]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)

        XCTAssertEqual(result.pinPointArray.count, 2)
        XCTAssertEqual(result.pinPathArray.count, 1)
        
        let p0 = result.pinPointArray[0]
        let p1 = result.pinPointArray[1]

        XCTAssertEqual(p0.type, .out_in)
        XCTAssertEqual(p1.type, .outside)
        
        let path = result.pinPathArray[0]

        XCTAssertEqual(path.v0.type, .inside)
    }
    
    func test_35() {
        let data = PinTestData.data[35]
        let iMaster = data[0]
        let iSlave = data[1]
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)

        XCTAssertEqual(result.pinPointArray.count, 1)
        XCTAssertEqual(result.pinPathArray.count, 1)
        
        let p = result.pinPointArray[0]

        XCTAssertEqual(p.type, .inside)
        
        let path = result.pinPathArray[0]

        XCTAssertEqual(path.v0.type, .outside)
    }


    func test_100() {
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
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        let path = result.pinPathArray[0]
        XCTAssertEqual(path.v0.point, IntPoint(x: 2, y: 2))
        XCTAssertEqual(path.v1.point, IntPoint(x: 2, y: 0))
    }
    
    
    func test_101() {
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
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)

        XCTAssertEqual(result.pinPathArray.count, 1)
        let path = result.pinPathArray[0]
        XCTAssertEqual(path.v0.point, IntPoint(x: 2, y: 0))
        XCTAssertEqual(path.v1.point, IntPoint(x: 2, y: -2))
    }
 
    
    func test_102() {
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
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)
        
        XCTAssertEqual(result.pinPathArray.count, 1)
        let path = result.pinPathArray[0]
        XCTAssertEqual(path.v0.point, IntPoint(x: 2, y: 2))
        XCTAssertEqual(path.v1.point, IntPoint(x: 2, y: 0))
    }

    
    func test_103() {
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
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)

        let paths = result.pinPathArray
        XCTAssertEqual(paths.count, 0)
        
        let points = result.pinPointArray
        XCTAssertEqual(points.count, 1)
        
        
        XCTAssertEqual(IntPoint(x: 2, y: 2), points[0].point)
        XCTAssertEqual(PinPoint.PinType.in_out, points[0].type)
    }
    
    
    func test_104() {
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
        
        let result = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: .null)

        let paths = result.pinPathArray
        XCTAssertEqual(paths.count, 0)
        
        let points = result.pinPointArray
        XCTAssertEqual(points.count, 1)
        
        
        XCTAssertEqual(IntPoint(x: 2, y: 2), points[0].point)
        XCTAssertEqual(PinPoint.PinType.in_out, points[0].type)
    }

}
