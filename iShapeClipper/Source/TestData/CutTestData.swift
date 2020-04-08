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
        // 0
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -15, y: -15),
                        Point(x: -15, y: 15),
                        Point(x: 15, y: 15),
                        Point(x: 15, y: -15)
                    ].int,
                    holes: [
                        [
                            Point(x: -10, y: 10),
                            Point(x: -10, y: -10),
                            Point(x: 10, y: -10),
                            Point(x: 10, y: 10)
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
        // 1
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
        // 2
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
        // 3
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
        // 4
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
                Point(x: 20, y: 25)
            ].int
        ),
        // 5
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
                Point(x: 20, y: 25)
            ].int
        ),
        // 6
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
                Point(x: -15, y: 15),
                Point(x: -15, y: -15),
                Point(x: 15, y: -15),
                Point(x: 15, y: 15)
            ].int
        ),
        // 7
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
                Point(x: -10, y: 10),
                Point(x: -10, y: -10),
                Point(x: 10, y: -10),
                Point(x: 10, y: 10)
            ].int
        ),
        // 8
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -10, y: -10),
                        Point(x: -10, y: 10),
                        Point(x: 10, y: 10),
                        Point(x: 10, y: -10)
                    ].int,
                    holes: [
                        [
                            Point(x: 5.0, y: 5.0),
                            Point(x: -5.0, y: 5.0),
                            Point(x: -5.0, y: -5.0),
                            Point(x: 5.0, y: -5.0)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -15, y: 15),
                Point(x: -15, y: -15),
                Point(x: 15, y: -15),
                Point(x: 15, y: 15)
            ].int
        ),
        // 9
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
                Point(x: -5, y: 15),
                Point(x: -5, y: -5),
                Point(x: 5, y: -5),
                Point(x: 5, y: 15)
            ].int
        ),
        // 10
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
                            Point(x: 5.0, y: -10.0),
                            Point(x: 5.0, y: -5.0),
                            Point(x: 0.0, y: -5.0),
                            Point(x: 0.0, y: -10.0)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: 0.0, y: 5.0),
                Point(x: -10.0, y: 5.0),
                Point(x: -10.0, y: 0.0),
                Point(x: 0.0, y: 0.0)
            ].int
        ),
        // 11
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
                            Point(x: 5.0, y: -10.0),
                            Point(x: 5.0, y: -5.0),
                            Point(x: 0.0, y: -5.0),
                            Point(x: 0.0, y: -10.0)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: 15.0, y: 5.0),
                Point(x: -10.0, y: 5.0),
                Point(x: -10.0, y: 0.0),
                Point(x: 15.0, y: 0.0)
            ].int
        ),
        // 12
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -20, y: 30),
                        Point(x: 20, y: 30),
                        Point(x: 20, y: -25),
                        Point(x: -20, y: -25)
                    ].int,
                    holes: [
                        [
                            Point(x: -5, y: 25),
                            Point(x: -5, y: 20),
                            Point(x: 5, y: 20),
                            Point(x: 5, y: 25)
                        ].int,
                        [
                            Point(x: -15, y: 15),
                            Point(x: -15, y: 10),
                            Point(x: 15, y: 10),
                            Point(x: 15, y: 15)
                        ].int,
                        [
                            Point(x: -5, y: 5),
                            Point(x: -5, y: 0),
                            Point(x: 5, y: 0),
                            Point(x: 5, y: 5)
                        ].int,
                        [
                            Point(x: -15, y: -5),
                            Point(x: -15, y: -10),
                            Point(x: 15, y: -10),
                            Point(x: 15, y: -5)
                        ].int,
                        [
                            Point(x: -5, y: -15),
                            Point(x: -5, y: -20),
                            Point(x: 5, y: -20),
                            Point(x: 5, y: -15)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: 10, y: 20),
                Point(x: 10, y: -15),
                Point(x: 25, y: -15),
                Point(x: 25, y: 20)
            ].int
        ),
        // 13
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -20, y: 30),
                        Point(x: 20, y: 30),
                        Point(x: 20, y: -25),
                        Point(x: -20, y: -25)
                    ].int,
                    holes: [
                        [
                            Point(x: -5, y: 25),
                            Point(x: -5, y: 20),
                            Point(x: 5, y: 20),
                            Point(x: 5, y: 25)
                        ].int,
                        [
                            Point(x: -15, y: 15),
                            Point(x: -15, y: 10),
                            Point(x: 15, y: 10),
                            Point(x: 15, y: 15)
                        ].int,
                        [
                            Point(x: -5, y: 5),
                            Point(x: -5, y: 0),
                            Point(x: 5, y: 0),
                            Point(x: 5, y: 5)
                        ].int,
                        [
                            Point(x: -15, y: -5),
                            Point(x: -15, y: -10),
                            Point(x: 15, y: -10),
                            Point(x: 15, y: -5)
                        ].int,
                        [
                            Point(x: -5, y: -15),
                            Point(x: -5, y: -20),
                            Point(x: 5, y: -20),
                            Point(x: 5, y: -15)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -25, y: 10),
                Point(x: -25, y: -10),
                Point(x: 25, y: -10),
                Point(x: 25, y: 10)
            ].int
        ),
        // 14
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -20, y: 20),
                        Point(x: 20, y: 20),
                        Point(x: 20, y: -15),
                        Point(x: -20, y: -15)
                    ].int,
                    holes: [
                        [
                            Point(x: -5, y: 5),
                            Point(x: -5, y: 0),
                            Point(x: 5, y: 0),
                            Point(x: 5, y: 5)
                        ].int,
                        [
                            Point(x: -15, y: -5),
                            Point(x: -15, y: -10),
                            Point(x: 15, y: -10),
                            Point(x: 15, y: -5)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -5.5, y: 2.5),
                Point(x: 25, y: -15),
                Point(x: 25, y: 20)
            ].int
        ),
        // 15
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -20, y: 20),
                        Point(x: 20, y: 20),
                        Point(x: 20, y: -15),
                        Point(x: -20, y: -15)
                    ].int,
                    holes: [
                        [
                            Point(x: -5, y: 5),
                            Point(x: -5, y: 0),
                            Point(x: 5, y: 0),
                            Point(x: 5, y: 5)
                        ].int,
                        [
                            Point(x: -15, y: -5),
                            Point(x: -15, y: -10),
                            Point(x: 15, y: -10),
                            Point(x: 15, y: -5)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -5.5, y: 2.5),
                Point(x: 25, y: -15),
                Point(x: 0, y: 5)
            ].int
        ),
        // 16
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -5, y: 5),
                        Point(x: -5, y: -5),
                        Point(x: 10, y: -5),
                        Point(x: 10, y: -10),
                        Point(x: -10, y: -10),
                        Point(x: -10, y: 10),
                        Point(x: 10, y: 10),
                        Point(x: 10, y: 5)
                    ].int,
                    holes: []
                )
            ),
            path: [
                Point(x: 0, y: 15),
                Point(x: 0, y: -15),
                Point(x: 5, y: -15),
                Point(x: 5, y: 15)
            ].int
        ),
        // 17
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -5, y: 5),
                        Point(x: -5, y: -5),
                        Point(x: 10, y: -5),
                        Point(x: 10, y: -20),
                        Point(x: -10, y: -20),
                        Point(x: -10, y: 20),
                        Point(x: 10, y: 20),
                        Point(x: 10, y: 5)
                    ].int,
                    holes: []
                )
            ),
            path: [
                Point(x: 0, y: 15),
                Point(x: 0, y: -15),
                Point(x: 5, y: -15),
                Point(x: 5, y: 15)
            ].int
        ),
        // 18
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -5, y: 5),
                        Point(x: -5, y: -5),
                        Point(x: 20, y: -5),
                        Point(x: 20, y: -25),
                        Point(x: -10, y: -25),
                        Point(x: -10, y: 25),
                        Point(x: 20, y: 25),
                        Point(x: 20, y: 5)
                    ].int,
                    holes: [
                        [
                            Point(x: -5, y: 15),
                            Point(x: -5, y: 10),
                            Point(x: 10, y: 10),
                            Point(x: 10, y: 15)
                        ].int,
                        [
                            Point(x: 5, y: -10),
                            Point(x: 5, y: -15),
                            Point(x: 10, y: -15),
                            Point(x: 10, y: -10)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: 0, y: 20),
                Point(x: 0, y: -20),
                Point(x: 15, y: -20),
                Point(x: 15, y: 20)
            ].int
        ),
        // 19
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -25, y: 20),
                        Point(x: 25, y: 20),
                        Point(x: 25, y: -20),
                        Point(x: -25, y: -20)
                    ].int,
                    holes: [
                        [
                            Point(x: -20, y: 15),
                            Point(x: -20, y: 5),
                            Point(x: 20, y: 5),
                            Point(x: 20, y: 15)
                        ].int,
                        [
                            Point(x: -5, y: 0),
                            Point(x: -5, y: -5),
                            Point(x: 5, y: -5),
                            Point(x: 5, y: 0)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -15, y: 10),
                Point(x: -15, y: -15),
                Point(x: 15, y: -15),
                Point(x: 15, y: 10),
                Point(x: 10, y: 10),
                Point(x: 10, y: -10),
                Point(x: -10, y: -10),
                Point(x: -10, y: 10)
            ].int
        ),
        // 20
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -25, y: 30),
                        Point(x: 25, y: 30),
                        Point(x: 25, y: -30),
                        Point(x: -25, y: -30)
                    ].int,
                    holes: [
                        [
                            Point(x: -20, y: 5),
                            Point(x: -20, y: -5),
                            Point(x: 20, y: -5),
                            Point(x: 20, y: 5)
                        ].int,
                        [
                            Point(x: -5, y: -10),
                            Point(x: -5, y: -15),
                            Point(x: 5, y: -15),
                            Point(x: 5, y: -10)
                        ].int,
                        [
                            Point(x: -5, y: 15),
                            Point(x: -5, y: 10),
                            Point(x: 5, y: 10),
                            Point(x: 5, y: 15)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: 15, y: 5),
                Point(x: 15, y: 25),
                Point(x: -15, y: 25),
                Point(x: -15, y: -25),
                Point(x: 15, y: -25),
                Point(x: 15, y: -5),
                Point(x: 10, y: -5),
                Point(x: 10, y: -20),
                Point(x: -10, y: -20),
                Point(x: -10, y: 20),
                Point(x: 10, y: 20),
                Point(x: 10, y: 5)
            ].int
        ),
        // 21
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
                            Point(x: -5, y: 5),
                            Point(x: -5, y: -5),
                            Point(x: 5, y: -5),
                            Point(x: 5, y: 5)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -10, y: 5),
                Point(x: -10, y: -5),
                Point(x: 10, y: -5),
                Point(x: 10, y: 5)
            ].int
        ),
        // 22
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -25, y: 20),
                        Point(x: 25, y: 20),
                        Point(x: 25, y: -20),
                        Point(x: -25, y: -20)
                    ].int,
                    holes: [
                        [
                            Point(x: 10, y: 0),
                            Point(x: 10, y: -5),
                            Point(x: 20, y: -5),
                            Point(x: 20, y: 0)
                        ].int,
                        [
                            Point(x: 10, y: -10),
                            Point(x: 10, y: -15),
                            Point(x: 20, y: -15),
                            Point(x: 20, y: -10)
                        ].int,
                        [
                            Point(x: -20, y: 15),
                            Point(x: -20, y: 5),
                            Point(x: 20, y: 5),
                            Point(x: 20, y: 15)
                        ].int,
                        [
                            Point(x: -5, y: 0),
                            Point(x: -5, y: -5),
                            Point(x: 5, y: -5),
                            Point(x: 5, y: 0)
                        ].int,
                        [
                            Point(x: -20, y: 0),
                            Point(x: -20, y: -5),
                            Point(x: -10, y: -5),
                            Point(x: -10, y: 0)
                        ].int,
                        [
                            Point(x: -20, y: -10),
                            Point(x: -20, y: -15),
                            Point(x: -10, y: -15),
                            Point(x: -10, y: -10)
                        ].int,
                        [
                            Point(x: -5, y: -10),
                            Point(x: -5, y: -15),
                            Point(x: 5, y: -15),
                            Point(x: 5, y: -10)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -15, y: 10),
                Point(x: -15, y: -15),
                Point(x: 15, y: -15),
                Point(x: 15, y: 10),
                Point(x: 10, y: 10),
                Point(x: 10, y: -10),
                Point(x: -10, y: -10),
                Point(x: -10, y: 10)
            ].int
        ),
        // 23
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -25, y: 30),
                        Point(x: 25, y: 30),
                        Point(x: 25, y: -30),
                        Point(x: -25, y: -30)
                    ].int,
                    holes: [
                        [
                            Point(x: -20, y: 5),
                            Point(x: -20, y: -5),
                            Point(x: 20, y: -5),
                            Point(x: 20, y: 5)
                        ].int,
                        [
                            Point(x: -5, y: -10),
                            Point(x: -5, y: -15),
                            Point(x: 5, y: -15),
                            Point(x: 5, y: -10)
                        ].int,
                        [
                            Point(x: -5, y: -20),
                            Point(x: -5, y: -25),
                            Point(x: 5, y: -25),
                            Point(x: 5, y: -20)
                        ].int,
                        [
                            Point(x: -15, y: -20),
                            Point(x: -15, y: -25),
                            Point(x: -10, y: -25),
                            Point(x: -10, y: -20)
                        ].int,
                        [
                            Point(x: 10, y: -10),
                            Point(x: 10, y: -15),
                            Point(x: 20, y: -15),
                            Point(x: 20, y: -10)
                        ].int,
                        [
                            Point(x: -5, y: 15),
                            Point(x: -5, y: 10),
                            Point(x: 5, y: 10),
                            Point(x: 5, y: 15)
                        ].int,
                        [
                            Point(x: -5, y: 25),
                            Point(x: -5, y: 20),
                            Point(x: 5, y: 20),
                            Point(x: 5, y: 25)
                        ].int,
                        [
                            Point(x: 10, y: 25),
                            Point(x: 10, y: 20),
                            Point(x: 15, y: 20),
                            Point(x: 15, y: 25)
                        ].int,
                        [
                            Point(x: -20, y: 15),
                            Point(x: -20, y: 10),
                            Point(x: -10, y: 10),
                            Point(x: -10, y: 15)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: 15, y: 5),
                Point(x: 15, y: 25),
                Point(x: -15, y: 25),
                Point(x: -15, y: -25),
                Point(x: 15, y: -25),
                Point(x: 15, y: -5),
                Point(x: 10, y: -5),
                Point(x: 10, y: -20),
                Point(x: -10, y: -20),
                Point(x: -10, y: 20),
                Point(x: 10, y: 20),
                Point(x: 10, y: 5)
            ].int
        ),
        // 24
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: -25, y: 20),
                        Point(x: 25, y: 20),
                        Point(x: 25, y: -20),
                        Point(x: -25, y: -20)
                    ].int,
                    holes: [
                        [
                            Point(x: -20, y: 15),
                            Point(x: -20, y: 5),
                            Point(x: 20, y: 5),
                            Point(x: 20, y: 15)
                        ].int,
                        [
                            Point(x: 0, y: 0),
                            Point(x: 0, y: -5),
                            Point(x: 5, y: -5),
                            Point(x: 5, y: 0)
                        ].int,
                        [
                            Point(x: -20, y: 0),
                            Point(x: -20, y: -5),
                            Point(x: -5, y: -5),
                            Point(x: -5, y: 0)
                        ].int,
                        [
                            Point(x: -5, y: -7.5),
                            Point(x: -5, y: -17.5),
                            Point(x: 5, y: -17.5),
                            Point(x: 5, y: -7.5)
                        ].int
                    ]
                )
            ),
            path: [
                Point(x: -15, y: 10),
                Point(x: -15, y: -15),
                Point(x: 15, y: -15),
                Point(x: 15, y: 10),
                Point(x: 10, y: 10),
                Point(x: 10, y: -10),
                Point(x: -10, y: -10),
                Point(x: -10, y: 10)
            ].int
        ),
        // 25
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
                        Point(x: 20, y: -20),
                        Point(x: -20, y: -20),
                        Point(x: -20, y: 20),
                        Point(x: 20, y: 20)
                    ].int,
                    holes: [
                        [
                            Point(x: -10, y: -10),
                            Point(x: 10, y: -10),
                            Point(x: 10, y: 10),
                            Point(x: -10, y: 10)
                        ].int,
                    ]
                )
            ),
            path: [
                Point(x: -5, y: 5),
                Point(x: -5, y: -5),
                Point(x: 5, y: -10),
                Point(x: 5, y: 5)
            ].int
        ),
        TestData(
            shape: PlainShape(
                iShape: IntShape(
                    hull: [
//                        IntPoint(x: 5836, y: 5017),
//                        IntPoint(x: 5836, y: -1823),
//                        IntPoint(x: 10233, y: -7063),
//                        IntPoint(x: 14410, y: -7799),
                        IntPoint(x: 14410, y: -7800),
                        IntPoint(x: 14638, y: -7840),
                        IntPoint(x: 14656, y: -7862),
                        IntPoint(x: 14740, y: -7877),
                        IntPoint(x: 14779, y: -7923),
                        IntPoint(x: 14874, y: -7940),
                        IntPoint(x: 14963, y: -8046),
                        IntPoint(x: 15202, y: -8088),
                        IntPoint(x: 15270, y: -8169),
                        IntPoint(x: 15427, y: -8197),
                        IntPoint(x: 15455, y: -8230),
                        IntPoint(x: 15610, y: -8257),
                        IntPoint(x: 15639, y: -8292),
                        IntPoint(x: 15723, y: -8307),
                        IntPoint(x: 15762, y: -8353),
                        IntPoint(x: 15869, y: -8372),
                        IntPoint(x: 16007, y: -8537),
                        IntPoint(x: 16091, y: -8552),
                        IntPoint(x: 16130, y: -8599),
                        IntPoint(x: 16214, y: -8614),
                        IntPoint(x: 16253, y: -8660),
                        IntPoint(x: 16265, y: -8662),
                        IntPoint(x: 16315, y: -8722),
                        IntPoint(x: 16398, y: -8737),
                        IntPoint(x: 16437, y: -8783),
                        IntPoint(x: 16521, y: -8798),
                        IntPoint(x: 16560, y: -8845),
                        IntPoint(x: 17017, y: -8925),
                        IntPoint(x: 17052, y: -8967),
                        IntPoint(x: 22909, y: -10000),
                        IntPoint(x: -30000, y: -10000),
                        IntPoint(x: -30000, y: 40000),
                        IntPoint(x: 30000, y: 40000),
                        IntPoint(x: 30000, y: 9156),
                        IntPoint(x: 28313, y: 8858),
                        IntPoint(x: 28088, y: 8988),
                        IntPoint(x: 28016, y: 8975),
                        IntPoint(x: 27781, y: 9111),
                        IntPoint(x: 27720, y: 9100),
                        IntPoint(x: 27596, y: 9172),
                        IntPoint(x: 27571, y: 9168),
                        IntPoint(x: 27351, y: 9295),
                        IntPoint(x: 27339, y: 9293),
                        IntPoint(x: 27228, y: 9357),
                        IntPoint(x: 27181, y: 9349),
                        IntPoint(x: 27166, y: 9357),
                        IntPoint(x: 27073, y: 9341),
                        IntPoint(x: 27044, y: 9357),
                        IntPoint(x: 26950, y: 9340),
                        IntPoint(x: 26921, y: 9357),
                        IntPoint(x: 26827, y: 9340),
                        IntPoint(x: 26798, y: 9357),
                        IntPoint(x: 26751, y: 9349),
                        IntPoint(x: 26736, y: 9357),
                        IntPoint(x: 26723, y: 9355),
                        IntPoint(x: 26614, y: 9418),
                        IntPoint(x: 26472, y: 9393),
                        IntPoint(x: 26429, y: 9418),
                        IntPoint(x: 26382, y: 9410),
                        IntPoint(x: 26368, y: 9418),
                        IntPoint(x: 26227, y: 9393),
                        IntPoint(x: 26184, y: 9418),
                        IntPoint(x: 26125, y: 9408),
                        IntPoint(x: 25999, y: 9480),
                        IntPoint(x: 25906, y: 9464),
                        IntPoint(x: 25877, y: 9480),
                        IntPoint(x: 25735, y: 9455),
                        IntPoint(x: 25692, y: 9480),
                        IntPoint(x: 25645, y: 9472),
                        IntPoint(x: 25631, y: 9480),
                        IntPoint(x: 25537, y: 9463),
                        IntPoint(x: 25508, y: 9480),
                        IntPoint(x: 25461, y: 9472),
                        IntPoint(x: 25447, y: 9480),
                        IntPoint(x: 25400, y: 9472),
                        IntPoint(x: 25385, y: 9480),
                        IntPoint(x: 25244, y: 9455),
                        IntPoint(x: 25201, y: 9480),
                        IntPoint(x: 25154, y: 9472),
                        IntPoint(x: 25139, y: 9480),
                        IntPoint(x: 24998, y: 9455),
                        IntPoint(x: 24955, y: 9480),
                        IntPoint(x: 24814, y: 9455),
                        IntPoint(x: 24771, y: 9480),
                        IntPoint(x: 24724, y: 9472),
                        IntPoint(x: 24709, y: 9480),
                        IntPoint(x: 24662, y: 9472),
                        IntPoint(x: 24648, y: 9480),
                        IntPoint(x: 24601, y: 9472),
                        IntPoint(x: 24587, y: 9480),
                        IntPoint(x: 24540, y: 9472),
                        IntPoint(x: 24525, y: 9480),
                        IntPoint(x: 24478, y: 9472),
                        IntPoint(x: 24464, y: 9480),
                        IntPoint(x: 24417, y: 9472),
                        IntPoint(x: 24402, y: 9480),
                        IntPoint(x: 24355, y: 9472),
                        IntPoint(x: 24341, y: 9480),
                        IntPoint(x: 24294, y: 9472),
                        IntPoint(x: 24279, y: 9480),
                        IntPoint(x: 24266, y: 9478),
                        IntPoint(x: 24157, y: 9541),
                        IntPoint(x: 24110, y: 9533),
                        IntPoint(x: 24095, y: 9541),
                        IntPoint(x: 24048, y: 9533),
                        IntPoint(x: 24034, y: 9541),
                        IntPoint(x: 23987, y: 9533),
                        IntPoint(x: 23972, y: 9541),
                        IntPoint(x: 23925, y: 9533),
                        IntPoint(x: 23911, y: 9541),
                        IntPoint(x: 23886, y: 9536),
                        IntPoint(x: 23665, y: 9664),
                        IntPoint(x: 23524, y: 9639),
                        IntPoint(x: 23481, y: 9664),
                        IntPoint(x: 23474, y: 9663),
                        IntPoint(x: 22621, y: 10155),
                        IntPoint(x: 22609, y: 10153),
                        IntPoint(x: 22498, y: 10217),
                        IntPoint(x: 22438, y: 10206),
                        IntPoint(x: 22314, y: 10278),
                        IntPoint(x: 22220, y: 10261),
                        IntPoint(x: 22191, y: 10278),
                        IntPoint(x: 22178, y: 10276),
                        IntPoint(x: 22068, y: 10339),
                        IntPoint(x: 22043, y: 10335),
                        IntPoint(x: 21822, y: 10462),
                        IntPoint(x: 21750, y: 10450),
                        IntPoint(x: 21515, y: 10585),
                        IntPoint(x: 21503, y: 10583),
                        IntPoint(x: 21392, y: 10647),
                        IntPoint(x: 21285, y: 10628),
                        IntPoint(x: 21147, y: 10708),
                        IntPoint(x: 21134, y: 10706),
                        IntPoint(x: 21024, y: 10769),
                        IntPoint(x: 20985, y: 10762),
                        IntPoint(x: 19058, y: 11875),
                        IntPoint(x: 19046, y: 11873),
                        IntPoint(x: 18935, y: 11937),
                        IntPoint(x: 18922, y: 11935),
                        IntPoint(x: 18813, y: 11998),
                        IntPoint(x: 18800, y: 11996),
                        IntPoint(x: 18690, y: 12059),
                        IntPoint(x: 18618, y: 12046),
                        IntPoint(x: 18383, y: 12182),
                        IntPoint(x: 18336, y: 12174),
                        IntPoint(x: 18321, y: 12182),
                        IntPoint(x: 18274, y: 12174),
                        IntPoint(x: 18260, y: 12182),
                        IntPoint(x: 18166, y: 12165),
                        IntPoint(x: 18137, y: 12182),
                        IntPoint(x: 18090, y: 12174),
                        IntPoint(x: 18076, y: 12182),
                        IntPoint(x: 18029, y: 12174),
                        IntPoint(x: 18014, y: 12182),
                        IntPoint(x: 17967, y: 12174),
                        IntPoint(x: 17953, y: 12182),
                        IntPoint(x: 17906, y: 12174),
                        IntPoint(x: 17891, y: 12182),
                        IntPoint(x: 11155, y: 10994),
                        IntPoint(x: 11106, y: 10935),
                        IntPoint(x: 11093, y: 10933),
                        IntPoint(x: 11065, y: 10900),
                        IntPoint(x: 10909, y: 10872),
                        IntPoint(x: 10859, y: 10812),
                        IntPoint(x: 10848, y: 10810),
                        IntPoint(x: 10820, y: 10777),
                        IntPoint(x: 10663, y: 10749),
                        IntPoint(x: 10414, y: 10452),
//                        IntPoint(x: 10356, y: 10442),
//                        IntPoint(x: 10306, y: 10382),
//                        IntPoint(x: 10295, y: 10380),
//                        IntPoint(x: 10246, y: 10321),
//                        IntPoint(x: 10233, y: 10319),
//                        IntPoint(x: 5836, y: 5079)
 
                    ],
                    holes: []
                )
            ),
            path: [
                IntPoint(x: 25233, y: 1597),
                IntPoint(x: 22894, y: 8025),
                IntPoint(x: 16970, y: 11445),
                IntPoint(x: 10233, y: 10257),
                IntPoint(x: 5836, y: 5017),
                IntPoint(x: 5836, y: -1823),
                IntPoint(x: 10233, y: -7063),
                IntPoint(x: 16970, y: -8251),
                IntPoint(x: 22894, y: -4831)
            ]
        )
    ]
}


private extension Array where Element == IntPoint {
    func scale(value: Int64) -> [IntPoint] {
        var result = Array(repeating: .zero, count: self.count)
        for i in 0..<self.count {
            let p = self[i]
            result[i] = IntPoint(x: p.x * value, y: p.y * value)
        }
        return result
    }
    
    func points(scale: Int64 = 1) -> [Point] {
        var result = [Point](repeating: .zero, count: self.count)
        let geom = IntGeom.defGeom
        for i in 0..<self.count {
            let p = self[i]
            let x = geom.float(int: p.x * scale)
            let y = geom.float(int: p.y * scale)
            result[i] = Point(x: x, y: y)
        }
        return result
    }
}

private extension Array where Element == Point {
    var int: [IntPoint] {
        return IntGeom.defGeom.int(points: self)
    }
}
