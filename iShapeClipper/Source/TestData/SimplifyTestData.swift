//
//  SimplifyTestData.swift
//  iGeometry
//
//  Created by Nail Sharipov on 19.04.2020.
//

import Foundation
import iGeometry

struct SimplifyTestData {

    struct Polygon {
        let points: [IntPoint]
        let isClockWise: Bool
    }
    
    static let data: [Polygon] = [
        // 0
        Polygon(points: [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10)
            ].int, isClockWise: true
        ),
        // 1
        Polygon(points: [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: -10),
            Point(x: 10, y: 10)
            ].int, isClockWise: true
        ),
        // 2
        Polygon(points: [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: -15, y: -15)
            ].int, isClockWise: true
        ),
        // 3
        Polygon(points: [
            Point(x: 0, y: -10),
            Point(x: 0, y: 10),
            Point(x: 10, y: 10),
            Point(x: -10, y: 10)
            ].int, isClockWise: true
        ),
        // 4
        Polygon(points: [
            Point(x: 0, y: -10),
            Point(x: 0, y: 10),
            Point(x: 0, y: 0),
            Point(x: -10, y: 0)
            ].int, isClockWise: true
        ),
        // 5
        Polygon(points: [
            Point(x: 0, y: -10),
            Point(x: 0, y: 10),
            Point(x: 10, y: 0),
            Point(x: 0, y: 0)
            ].int, isClockWise: true
        ),
        // 6
        Polygon(points: [
            Point(x: 0, y: -5),
            Point(x: 0, y: 5),
            Point(x: 0, y: 10),
            Point(x: 0, y: -10)
            ].int, isClockWise: true
        ),
        // 7
        Polygon(points: [
            Point(x: -10, y: -10),
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: -10, y: -10)
            ].int, isClockWise: true
        ),
        // 8
        Polygon(points: [
            Point(x: 0, y: -10),
            Point(x: 0, y: 10),
            Point(x: 0, y: 10),
            Point(x: 10, y: -10)
            ].int, isClockWise: true
        ),
        // 9
        Polygon(points: [
            Point(x: 0, y: -10),
            Point(x: 0, y: 10),
            Point(x: 10, y: 10),
            Point(x: 0, y: 10)
            ].int, isClockWise: true
        ),
        // 10
        Polygon(points: [
            Point(x: -10, y: 0),
            Point(x: 10, y: 0),
            Point(x: -5, y: 0),
            Point(x: 5, y: 0)
            ].int, isClockWise: true
        ),
        // 11
        Polygon(points: [
            Point(x: -10, y: -15),
            Point(x: -20, y: -15),
            Point(x: -20, y: -10),
            Point(x: -15, y: -10),
            Point(x: -15, y: -5),
            Point(x: -20, y: -5),
            Point(x: -20, y: 0),
            Point(x: -15, y: 0),
            Point(x: -15, y: 5),
            Point(x: -20, y: 5),
            Point(x: -20, y: 15),
            Point(x: 20, y: 15),
            Point(x: 20, y: 5),
            Point(x: 15, y: 5),
            Point(x: 15, y: 0),
            Point(x: 20, y: 0),
            Point(x: 20, y: -5),
            Point(x: 15, y: -5),
            Point(x: 15, y: -10),
            Point(x: 20, y: -10),
            Point(x: 20, y: -15),
            Point(x: 10, y: -15)
            ].int, isClockWise: true
        ),
        // 100
        Polygon(points: [
            Point(x: -10, y: 10),
            Point(x: 0, y: 15),
            Point(x: 10, y: 10),
            Point(x: 15, y: 0),
            Point(x: 10, y: -10),
            Point(x: 0, y: -15),
            Point(x: -10, y: -10),
            Point(x: -15, y: 0)
            ].int, isClockWise: true
        )
        
    ]

}

private extension Array where Element == Point {
    var int: [IntPoint] {
        return IntGeom.defGeom.int(points: self)
    }
}
