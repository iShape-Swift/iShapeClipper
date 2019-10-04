//
//  PinPathTests.swift
//  ClipperTests
//
//  Created by Nail Sharipov on 04/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import XCTest
import iGeometry
@testable import iShapeClipper

final class PinPathTests: XCTestCase {
    
    private let iGeom = IntGeom.defGeom
    
    func testSingle_00() {
        
        let master = [
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10)
        ]
        
        let iMaster = iGeom.int(points: master)
        
        let slave = [
            Point(x: 0, y: 0),
            Point(x: 5, y: 10),
            Point(x: -5, y: 10)
        ]
        
        let iSlave = IntGeom.defGeom.int(points: slave)
        
        let result = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: PinPoint.Const.null)
        
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
        
        
        //         let points = path.extract(points: iGeom.int(points: master), iGeom: iGeom)
        //         XCTAssertEqual(points.count, 2)
    }
    
}

