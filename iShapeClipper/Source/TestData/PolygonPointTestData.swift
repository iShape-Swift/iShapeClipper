//
//  PolygonPointTestData.swift
//  iShapeClipper
//
//  Created by Nail Sharipov on 03.04.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import iGeometry

public struct PolygonPointTestData {
    
    public struct TestData {
        let point: Point
        let polygon: [Point]
        var points: [Point] {
            var points = self.polygon
            points.append(self.point)
            return points
        }
    }

    static let data: [TestData] = [
        // 0
        TestData(
            point: Point(x: 0, y: -15),
            polygon: [
                Point(x: 0, y: -10),
                Point(x: -10, y: 0),
                Point(x: 0, y: 10),
                Point(x: 10, y: 0)
            ]
        ),
        // 1
        TestData(
            point: Point(x: 0, y: 0),
            polygon: [
                Point(x: -10, y: -10),
                Point(x: 10, y: -10),
                Point(x: 10, y: 10),
                Point(x: -10, y: 10)
            ]
        ),
        // 2
        TestData(
            point: Point(x: 0, y: 0),
            polygon: [
                Point(x: -10, y: -10),
                Point(x: -10, y: 10),
                Point(x: 10, y: 10),
                Point(x: 10, y: -10)
            ]
        ),
        // 3
        TestData(
            point: IntGeom.defGeom.float(point: IntPoint(x: 196870, y: -73470)),
            polygon: [
                IntPoint(x: 34140, y: -16093),
                IntPoint(x: 31800, y: -9665),
                IntPoint(x: 25877, y: -6245),
                IntPoint(x: 19140, y: -7433),
                IntPoint(x: 14743, y: -12673),
                IntPoint(x: 14743, y: -19514),
                IntPoint(x: 19140, y: -24754),
                IntPoint(x: 25877, y: -25941),
                IntPoint(x: 31800, y: -22521)
            ].points(scale: 10)
        )
    ]
}

private extension Array where Element == IntPoint {
    
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
