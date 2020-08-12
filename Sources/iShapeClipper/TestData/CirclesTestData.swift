//
//  CirclesTestData.swift
//  iGeometry
//
//  Created by Nail Sharipov on 12.06.2020.
//

import iGeometry

public struct CirclesTestData {
    
    public static let data: [[CircleDefinition]] = [
        [
            CircleDefinition(center: Point(x: -15, y: 0), radius: 5),
            CircleDefinition(center: Point(x: -10, y: 0), radius: 5),
            CircleDefinition(center: Point(x: -5, y: 0), radius: 5),
            CircleDefinition(center: Point(x: 0, y: 0), radius: 5),
            CircleDefinition(center: Point(x: 5, y: 0), radius: 5),
            CircleDefinition(center: Point(x: 10, y: 0), radius: 5),
            CircleDefinition(center: Point(x: 15, y: 0), radius: 5),
            CircleDefinition(center: Point(x: 20, y: 0), radius: 5)
        ],
        [
            CircleDefinition(center: Point(x: 4, y: -10), radius: 5),
            CircleDefinition(center: Point(x: -14, y: 0), radius: 5),
            CircleDefinition(center: Point(x: -5, y: 0), radius: 5),
            CircleDefinition(center: Point(x: -14, y: -9), radius: 5),
            CircleDefinition(center: Point(x: -5, y: -9), radius: 5)
        ]
    ]
}
