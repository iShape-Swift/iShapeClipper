//
//  MultiUnionTestData.swift
//  iGeometry
//
//  Created by Nail Sharipov on 09.06.2020.
//

import iGeometry

public struct MultiUnionTestData {

    public struct TestData {
        let shapes: [PlainShape]
        let path: [IntPoint]
    }

    public static let data: [TestData] = [
        // 0
        TestData(
            shapes: [],
            path: [
                Point(x: 0, y: 15),
                Point(x: 10, y: 15),
                Point(x: 10, y: -15),
                Point(x: 0, y: -15)
            ].int
        ),
        // 1
        TestData(
            shapes: [
                PlainShape(points: [
                    Point(x: -15, y: 5),
                    Point(x: -5, y: 5),
                    Point(x: -5, y: -5),
                    Point(x: -15, y: -5)
                    ].int
                )
            ],
            path: [
                Point(x: 0, y: 15),
                Point(x: 10, y: 15),
                Point(x: 10, y: -15),
                Point(x: 0, y: -15)
            ].int
        ),
        // 2
        TestData(
            shapes: [
                PlainShape(points: [
                    Point(x: 5, y: 10),
                    Point(x: -15, y: 10),
                    Point(x: -15, y: 20),
                    Point(x: 5, y: 20)
                    ].int
                ),
                PlainShape(points: [
                    Point(x: -15, y: 5),
                    Point(x: -5, y: 5),
                    Point(x: -5, y: -5),
                    Point(x: -15, y: -5)
                    ].int
                ),
                PlainShape(points: [
                    Point(x: 5, y: -10),
                    Point(x: 5, y: -20),
                    Point(x: -15, y: -20),
                    Point(x: -15, y: -10)
                    ].int
                )
            ],
            path: [
                Point(x: 0, y: 15),
                Point(x: 10, y: 15),
                Point(x: 10, y: -15),
                Point(x: 0, y: -15)
            ].int
        ),
        // 3
        TestData(
            shapes: [
                PlainShape(points: [
                    Point(x: 15, y: 15),
                    Point(x: 15, y: 10),
                    Point(x: -10, y: 10),
                    Point(x: -10, y: -10),
                    Point(x: 15, y: -10),
                    Point(x: 15, y: -15),
                    Point(x: -15, y: -15),
                    Point(x: -15, y: 15)
                    ].int
                ),
                PlainShape(points: [
                    Point(x: -5, y: 5),
                    Point(x: 5, y: 5),
                    Point(x: 5, y: -5),
                    Point(x: -5, y: -5)
                    ].int
                )
            ],
            path: [
                Point(x: 10, y: 15),
                Point(x: 15, y: 15),
                Point(x: 15, y: -15),
                Point(x: 10, y: -15)
            ].int
        ),
        // 4
        TestData(
            shapes: [
                PlainShape(points: [
                    Point(x: 15, y: 15),
                    Point(x: 15, y: 10),
                    Point(x: -10, y: 10),
                    Point(x: -10, y: -10),
                    Point(x: 15, y: -10),
                    Point(x: 15, y: -15),
                    Point(x: -15, y: -15),
                    Point(x: -15, y: 15)
                    ].int
                ),
                PlainShape(points: [
                    Point(x: -5, y: 5),
                    Point(x: 15, y: 5),
                    Point(x: 15, y: -5),
                    Point(x: -5, y: -5)
                    ].int
                )
            ],
            path: [
                Point(x: 10, y: 15),
                Point(x: 15, y: 15),
                Point(x: 15, y: -15),
                Point(x: 10, y: -15)
            ].int
        ),
        // 5
        TestData(
            shapes: [
                PlainShape(points: [
                    Point(x: -5, y: 5),
                    Point(x: 15, y: 5),
                    Point(x: 15, y: -5),
                    Point(x: -5, y: -5)
                    ].int
                ),
                PlainShape(points: [
                    Point(x: 15, y: 15),
                    Point(x: 15, y: 10),
                    Point(x: -10, y: 10),
                    Point(x: -10, y: -10),
                    Point(x: 15, y: -10),
                    Point(x: 15, y: -15),
                    Point(x: -15, y: -15),
                    Point(x: -15, y: 15)
                    ].int
                )
            ],
            path: [
                Point(x: 10, y: 15),
                Point(x: 15, y: 15),
                Point(x: 15, y: -15),
                Point(x: 10, y: -15)
            ].int
        ),
        // 6
        
        TestData(
            shapes: [
                {
                    var shape = PlainShape(points: [
                        Point(x: -10, y: 10),
                        Point(x: 10, y: 10),
                        Point(x: 10, y: -10),
                        Point(x: -10, y: -10)
                    ].int)
                    shape.add(path: [
                        Point(x: 5, y: 5),
                        Point(x: -5, y: 5),
                        Point(x: -5, y: -5),
                        Point(x: 5, y: -5)
                    ].int, isClockWise: false)
                    return shape
                }(),
                PlainShape(points: [
                    Point(x: -20, y: 5),
                    Point(x: -10, y: 5),
                    Point(x: -10, y: -5),
                    Point(x: -20, y: -5)
                    ].int
                )
            ],
            path: [
                Point(x: -15, y: 15),
                Point(x: 15, y: 15),
                Point(x: 15, y: -15),
                Point(x: -15, y: -15)
            ].int
        )
    ]
}

private extension Array where Element == Point {
    var int: [IntPoint] {
        return IntGeom.defGeom.int(points: self)
    }
}
