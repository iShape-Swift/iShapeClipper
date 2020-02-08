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
        )
    ]
}

extension Array where Element == Point {
    var int: [IntPoint] {
        return IntGeom.defGeom.int(points: self)
    }
}

