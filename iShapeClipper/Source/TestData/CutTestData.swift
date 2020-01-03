//
//  CutTestData.swift
//  iGeometry
//
//  Created by Nail Sharipov on 24.12.2019.
//

import Foundation
import iGeometry

struct CutTestData {
    
    struct TestData {
        
        let shape: PlainShape
        let path: [IntPoint]
        
    }
    
    
    static let data: [TestData] = [
        /*
        // 0
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: 10.0, y: -15.0),
                        Point(x: -5.0, y: -15.0),
                        Point(x: -5.0, y: 10.0),
                        Point(x: 10.0, y: 10.0)
                    ].int,
                    holes: [
                        [
                            Point(x: 0.0, y: -10.0),
                            Point(x: 0.0, y: -5.0),
                            Point(x: 5.0, y: -5.0),
                            Point(x: 5.0, y: -10.0)
                        ].int
                    ]
            )
        ),
            path: [
                Point(x: 0.0, y: 0.0),
                Point(x: -10.0, y: 0.0),
                Point(x: -10.0, y: 5.0),
                Point(x: 0.0, y: 5.0)
            ].int
        ),
        // 1
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: 10.0, y: -15.0),
                        Point(x: -5.0, y: -15.0),
                        Point(x: -5.0, y: 10.0),
                        Point(x: 10.0, y: 10.0)
                    ].int,
                    holes: [
                        [
                            Point(x: 0.0, y: -10.0),
                            Point(x: 0.0, y: -5.0),
                            Point(x: 5.0, y: -5.0),
                            Point(x: 5.0, y: -10.0)
                        ].int
                    ]
            )
        ),
            path: [
                Point(x: 15.0, y: 0.0),
                Point(x: -10.0, y: 0.0),
                Point(x: -10.0, y: 5.0),
                Point(x: 15.0, y: 5.0)
            ].int
        ),
        */
        // 0
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -10, y: -10),
                        Point(x: -10, y: 10),
                        Point(x: 10, y: 10),
                        Point(x: 10, y: -10)
                    ].int,
                    holes: []
                )
            ),
            path: [
                Point(x: -5, y: 5),
                Point(x: -5, y: -5),
                Point(x: 5, y: -5),
                Point(x: 5, y: 5)
            ].int
        ),
        // 1
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -15, y: 15),
                        Point(x: 15, y: 15),
                        Point(x: 15, y: -15),
                        Point(x: -15, y: -15)
                    ].int,
                    holes: [
                        [
                            Point(x: -10, y: 10),
                            Point(x: -10, y: -5),
                            Point(x: 5, y: -5),
                            Point(x: 5, y: 10)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -5, y: 5),
                Point(x: -5, y: -10),
                Point(x: 10, y: -10),
                Point(x: 10, y: 5)
            ].int
        ),
        // 2
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -15, y: 10),
                        Point(x: 15, y: 10),
                        Point(x: 15, y: -10),
                        Point(x: -15, y: -10)
                    ].int,
                    holes: [
                        [
                            Point(x: -10, y: 5),
                            Point(x: -10, y: 0),
                            Point(x: 0, y: 0),
                            Point(x: 0, y: 5)
                        ].int,
                        [
                            Point(x: 0, y: 0),
                            Point(x: 0, y: -5),
                            Point(x: 10, y: -5),
                            Point(x: 10, y: 0)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -5, y: 5),
                Point(x: -5, y: -5),
                Point(x: 5, y: -5),
                Point(x: 5, y: 5)
            ].int
        ),
        // 3
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -30, y: 35),
                        Point(x: 30, y: 35),
                        Point(x: 30, y: -35),
                        Point(x: -30, y: -35)
                    ].int,
                    holes: [
                        [
                            Point(x: -5, y: 15),
                            Point(x: -5, y: 10),
                            Point(x: 5, y: 10),
                            Point(x: 5, y: 15)
                        ].int,
                        [
                            Point(x: -15, y: 5),
                            Point(x: -15, y: 0),
                            Point(x: 15, y: 0),
                            Point(x: 15, y: 5)
                        ].int,
                        [
                            Point(x: -5, y: -5),
                            Point(x: -5, y: -10),
                            Point(x: 5, y: -10),
                            Point(x: 5, y: -5)
                        ].int,
                        [
                            Point(x: -15, y: -15),
                            Point(x: -15, y: -20),
                            Point(x: 15, y: -20),
                            Point(x: 15, y: -15)
                        ].int,
                        [
                            Point(x: -5, y: -25),
                            Point(x: -5, y: -30),
                            Point(x: 5, y: -30),
                            Point(x: 5, y: -25)
                        ].int
                    ]
            )
        ),
            path: [
                Point(x: -20, y: 25),
                Point(x: -20, y: -25),
                Point(x: -10, y: -25),
                Point(x: -10, y: 20),
                Point(x: 10, y: 20),
                Point(x: 10, y: -25),
                Point(x: 20, y: -25),
                Point(x: 20, y: 25),
            ].int
        ),
        // 4
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -30, y: 35),
                        Point(x: 30, y: 35),
                        Point(x: 30, y: -40),
                        Point(x: -30, y: -40)
                    ].int,
                    holes: [
                        [
                            Point(x: -5, y: 15),
                            Point(x: -5, y: 10),
                            Point(x: 5, y: 10),
                            Point(x: 5, y: 15)
                        ].int,
                        [
                            Point(x: -15, y: 5),
                            Point(x: -15, y: 0),
                            Point(x: 15, y: 0),
                            Point(x: 15, y: 5)
                        ].int,
                        [
                            Point(x: -5, y: -5),
                            Point(x: -5, y: -10),
                            Point(x: 5, y: -10),
                            Point(x: 5, y: -5)
                        ].int,
                        [
                            Point(x: -15, y: -15),
                            Point(x: -15, y: -20),
                            Point(x: 15, y: -20),
                            Point(x: 15, y: -15)
                        ].int,
                        [
                            Point(x: -5, y: -25),
                            Point(x: -5, y: -30),
                            Point(x: 5, y: -30),
                            Point(x: 5, y: -25)
                        ].int
                    ]
            )
        ),
            path: [
                Point(x: -20, y: 25),
                Point(x: -20, y: -25),
                Point(x: -10, y: -25),
                Point(x: -10, y: 20),
                Point(x: 0, y: 20),
                Point(x: 0, y: -35),
                Point(x: 20, y: -35),
                Point(x: 20, y: 25),
            ].int
        )
    ]
}

extension Array where Element == Point {
    
    var int: [IntPoint] {
        return IntGeom.defGeom.int(points: self)
    }
    
}

