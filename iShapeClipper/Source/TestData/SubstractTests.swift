//
//  SubstractTests.swift
//  iShapeClipper
//
//  Created by Nail Sharipov on 04/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import iGeometry

struct SubstractTests {
    static let data = [
        [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -5.0, y: -15.0),
            Point(x: 5.0, y: -15.0),
            Point(x: 5.0, y: 0.0),
            Point(x: -5.0, y: 0.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -5.0, y: -15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: -5.0, y: 15.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -5.0, y: -15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: -5.0, y: 10.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -5.0, y: -10.0),
            Point(x: 15.0, y: -15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: -5.0, y: 10.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -5.0, y: -10.0),
            Point(x: 15.0, y: -15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: -10.0, y: 10.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 0.0, y: -10.0),
            Point(x: 15.0, y: -15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: -20.0, y: 10.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 15.0, y: -15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: -15.0, y: 0.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 0.0, y: -15.0),
            Point(x: 0.0, y: 0.0),
            Point(x: -15.0, y: 0.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 0.0, y: 10.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -5.0, y: -10.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 0.0, y: 10.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -5.0, y: 5.0),
            Point(x: 0.0, y: -10.0),
            Point(x: 10.0, y: 10.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -30.0, y: -10.0),
            Point(x: 0.0, y: -10.0),
            Point(x: 10.0, y: 10.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 5.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 5.0, y: -10.0),
            Point(x: -5.0, y: -10.0),
            Point(x: 0.0, y: -15.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -5.0, y: 10.0),
            Point(x: -10.0, y: 5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -5.0, y: -10.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 5.0),
            Point(x: 5.0, y: 10.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 0.0, y: 10.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 0.0, y: 10.0),
            Point(x: 0.0, y: -5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 5.0, y: 10.0)
        ],
           [
            Point(x: -5.0, y: 0.0),
            Point(x: 5.0, y: 0.0),
            Point(x: 0.0, y: -5.0),
            Point(x: -5.0, y: -5.0)
        ], [
            Point(x: -10.0, y: 10.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -5.0, y: -5.0),
            Point(x: -5.0, y: 5.0),
            Point(x: 5.0, y: 5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 10.0, y: 10.0)
        ],
           [
            Point(x: -7.5, y: 10.0),
            Point(x: 12.5, y: 10.0),
            Point(x: 12.5, y: 5.0),
            Point(x: -7.5, y: 5.0)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 30.0),
            Point(x: -25.0, y: 30.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: -20.0),
            Point(x: 20.0, y: 20.0),
            Point(x: 15.0, y: 20.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -20.0, y: -15.0),
            Point(x: -20.0, y: 25.0),
            Point(x: 5.0, y: 25.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0)
        ],
           [
            Point(x: -7.5, y: 2.5),
            Point(x: 12.5, y: 2.5),
            Point(x: 12.5, y: -2.5),
            Point(x: -7.5, y: -2.5)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 30.0),
            Point(x: -25.0, y: 30.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: -20.0),
            Point(x: 20.0, y: 20.0),
            Point(x: 15.0, y: 20.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -20.0, y: -15.0),
            Point(x: -20.0, y: 25.0),
            Point(x: 5.0, y: 25.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 10.0, y: 0.0),
            Point(x: 0.0, y: 5.0),
            Point(x: 0.0, y: -5.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 10.0, y: 10.0),
            Point(x: 0.0, y: 5.0),
            Point(x: 5.0, y: 0.0)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: 0.0, y: 5.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 10.0, y: -5.0),
            Point(x: 15.0, y: 5.0)
        ],
           [
            Point(x: -5.0, y: 0.0),
            Point(x: 5.0, y: 0.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -5.0, y: -5.0)
        ], [
            Point(x: -10.0, y: 10.0),
            Point(x: -10.0, y: -10.0),
            Point(x: 0.0, y: -10.0),
            Point(x: 0.0, y: 5.0),
            Point(x: 5.0, y: 5.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 10.0)
        ],
           [
            Point(x: 5.0, y: 15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: -15.0, y: -5.0),
            Point(x: 5.0, y: -5.0)
        ], [
            Point(x: -10.0, y: 10.0),
            Point(x: -10.0, y: 5.0),
            Point(x: 5.0, y: 5.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 10.0)
        ],
           [
            Point(x: 5.0, y: 15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: -15.0, y: -5.0),
            Point(x: 5.0, y: -5.0)
        ], [
            Point(x: -5.0, y: 5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 15.0, y: -5.0),
            Point(x: 15.0, y: 5.0)
        ],
           [
            Point(x: 5.0, y: 15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: -15.0, y: -5.0),
            Point(x: 5.0, y: -5.0)
        ], [
            Point(x: -5.0, y: 5.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 25.0, y: 0.0),
            Point(x: 15.0, y: 5.0)
        ],
           [
            Point(x: 5.0, y: 15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: -15.0, y: -5.0),
            Point(x: 5.0, y: -5.0)
        ], [
            Point(x: 5.0, y: 15.0),
            Point(x: 5.0, y: -10.0),
            Point(x: 15.0, y: -10.0),
            Point(x: 15.0, y: 5.0)
        ],
           [
            Point(x: 5.0, y: 15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: -15.0, y: -5.0),
            Point(x: 5.0, y: -5.0)
        ], [
            Point(x: -10.0, y: 0.0),
            Point(x: -10.0, y: -10.0),
            Point(x: 5.0, y: -5.0),
            Point(x: 10.0, y: 0.0)
        ],
           [
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: -5.0)
        ], [
            Point(x: 0.0, y: 5.0),
            Point(x: -20.0, y: 5.0),
            Point(x: -20.0, y: -15.0),
            Point(x: 10.0, y: -15.0),
            Point(x: 10.0, y: 20.0),
            Point(x: -20.0, y: 20.0),
            Point(x: -20.0, y: 10.0),
            Point(x: 5.0, y: 10.0),
            Point(x: 5.0, y: -10.0),
            Point(x: -15.0, y: -10.0),
            Point(x: -15.0, y: 0.0),
            Point(x: 0.0, y: 0.0)
        ],
           [
            Point(x: -18.5, y: -3.5),
            Point(x: -15.0, y: 10.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -10.0, y: 7.0)
        ], [
            Point(x: 0.0, y: 5.0),
            Point(x: -20.0, y: 5.0),
            Point(x: -20.0, y: -15.0),
            Point(x: 10.0, y: -15.0),
            Point(x: 10.0, y: 20.0),
            Point(x: -20.0, y: 20.0),
            Point(x: -20.0, y: 10.0),
            Point(x: 5.0, y: 10.0),
            Point(x: 5.0, y: -10.0),
            Point(x: -15.0, y: -10.0),
            Point(x: -15.0, y: 0.0),
            Point(x: 0.0, y: 0.0)
        ],
           [
            Point(x: -5.0, y: 15.0),
            Point(x: 0.0, y: 15.0),
            Point(x: 0.0, y: 3.0),
            Point(x: -5.0, y: 3.0)
        ], [
            Point(x: 5.0, y: 5.0),
            Point(x: -15.0, y: 5.0),
            Point(x: -15.0, y: -15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: 15.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0),
            Point(x: -10.0, y: 0.0),
            Point(x: 5.0, y: 0.0)
        ],
           [
            Point(x: -10.0, y: 15.0),
            Point(x: 10.0, y: 15.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -11.0, y: -5.0)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 30.0),
            Point(x: -25.0, y: 30.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: -20.0),
            Point(x: 20.0, y: 20.0),
            Point(x: 15.0, y: 20.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -20.0, y: -15.0),
            Point(x: -20.0, y: 25.0),
            Point(x: 5.0, y: 25.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0)
        ],
           [
            Point(x: -10.0, y: 15.0),
            Point(x: 10.0, y: 15.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -14.0, y: -4.0)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 30.0),
            Point(x: -25.0, y: 30.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: -20.0),
            Point(x: 20.0, y: 20.0),
            Point(x: 15.0, y: 20.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -20.0, y: -15.0),
            Point(x: -20.0, y: 25.0),
            Point(x: 5.0, y: 25.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0)
        ],
           [
            Point(x: -23.0, y: 20.0),
            Point(x: 7.0, y: 20.0),
            Point(x: 7.0, y: -16.0),
            Point(x: -20.0, y: -15.0)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 30.0),
            Point(x: -25.0, y: 30.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: -20.0),
            Point(x: 20.0, y: 20.0),
            Point(x: 15.0, y: 20.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -20.0, y: -15.0),
            Point(x: -20.0, y: 25.0),
            Point(x: 5.0, y: 25.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0)
        ],
           [
            Point(x: -23.0, y: 20.0),
            Point(x: 7.0, y: 20.0),
            Point(x: 4.0, y: -16.0),
            Point(x: -20.0, y: -15.0)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 30.0),
            Point(x: -25.0, y: 30.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: -20.0),
            Point(x: 20.0, y: 20.0),
            Point(x: 15.0, y: 20.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -20.0, y: -15.0),
            Point(x: -20.0, y: 25.0),
            Point(x: 5.0, y: 25.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0)
        ],
           [
            Point(x: -20.0, y: -15.0),
            Point(x: 12.0, y: -5.0),
            Point(x: 15.0, y: -9.0),
            Point(x: -15.0, y: -15.0)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 30.0),
            Point(x: -25.0, y: 30.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: -20.0),
            Point(x: 20.0, y: 20.0),
            Point(x: 15.0, y: 20.0),
            Point(x: 15.0, y: -14.0),
            Point(x: -20.0, y: -14.0),
            Point(x: -20.0, y: 25.0),
            Point(x: 5.0, y: 25.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0)
        ],
           [
            Point(x: 5.0, y: 10.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: 10.0)
        ], [
            Point(x: 0.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 0.0, y: 0.0)
        ],
           [
            Point(x: 5.0, y: 10.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -2.0, y: 2.0),
            Point(x: 2.0, y: 6.0),
            Point(x: -2.0, y: 10.0)
        ], [
            Point(x: 0.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 0.0, y: 0.0)
        ],
           [
            Point(x: -5.0, y: 0.0),
            Point(x: 10.0, y: 0.0),
            Point(x: 10.0, y: 10.0),
            Point(x: -10.0, y: 10.0),
            Point(x: -10.0, y: -10.0),
            Point(x: 15.0, y: -10.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: -15.0, y: 15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: 15.0, y: -5.0),
            Point(x: -5.0, y: -5.0)
        ], [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 20.0),
            Point(x: -15.0, y: 20.0),
            Point(x: -15.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 30.0),
            Point(x: -25.0, y: 30.0),
            Point(x: -25.0, y: -20.0),
            Point(x: 20.0, y: -20.0),
            Point(x: 20.0, y: 20.0),
            Point(x: 15.0, y: 20.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -20.0, y: -15.0),
            Point(x: -20.0, y: 25.0),
            Point(x: 5.0, y: 25.0),
            Point(x: 5.0, y: -5.0),
            Point(x: -10.0, y: -5.0),
            Point(x: -10.0, y: 15.0),
            Point(x: -5.0, y: 15.0),
            Point(x: -5.0, y: 0.0)
        ],
           [
            Point(x: 5.0, y: 15.0),
            Point(x: 15.0, y: 15.0),
            Point(x: 15.0, y: -15.0),
            Point(x: -15.0, y: -15.0),
            Point(x: -15.0, y: -5.0),
            Point(x: 5.0, y: -5.0)
        ], [
            Point(x: -5.0, y: 5.0),
            Point(x: -20.0, y: -10.0),
            Point(x: 15.0, y: -10.0),
            Point(x: 18.0, y: 16.5)
        ],
           [
            Point(x: -10.0, y: 10.0),
            Point(x: 10.0, y: 10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: -10.0, y: -10.0)
        ], [
            Point(x: -10.0, y: 10.0),
            Point(x: -10.0, y: -10.0),
            Point(x: 10.0, y: -10.0),
            Point(x: 10.0, y: 10.0)
        ]
    ]
}
