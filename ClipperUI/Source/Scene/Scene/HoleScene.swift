//
//  HoleScene.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 28.12.2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Cocoa
import iGeometry
@testable import iShapeClipper

final class HoleScene: CoordinateSystemScene {

    private var points: [[Point]] = [
        [
            Point(x: -15, y: 15),
            Point(x: 15, y: 15),
            Point(x: 15, y: -15),
            Point(x: -15, y: -15)
        ],
        [
            Point(x: -10, y: 10),
            Point(x: 10, y: 10),
            Point(x: 10, y: -10),
            Point(x: -10, y: -10)
        ],
        [
            Point(x: -5, y: 5),
            Point(x: -5, y: -5),
            Point(x: 5, y: -5),
            Point(x: 5, y: 5)
        ]
    ]
    
    private var activeIndex: (Int, Int)?
    
    
    override init() {
        super.init()
        self.addShapes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    private func update() {
        self.removeAll()
        self.addShapes()
    }
    
    private func removeAll() {
        guard let layers = self.sublayers else {
            return
        }
        for layer in layers {
            if !(layer is ShapeCoordinatSystem || layer is ShapeLine) {
                layer.removeFromSuperlayer()
            }
        }
    }
    
    private func addShapes() {
        let iGeom = IntGeom.defGeom
        
        let n = self.points.count - 1
        
        let holePoints = self.points[n]
        self.addSublayer(ShapeLinePolygon(points: holePoints.toCGPoints(), lineWidth: 0.2, color: Colors.orange))
        
        let hole = iGeom.int(points: holePoints)

        for i in 0..<n {
            let pathPoints = self.points[i]
            let path = iGeom.int(points: pathPoints)
            
            var factor: IntPoint = .empty
            if path.isContain(hole: hole, isClockWise: false, outPoint: &factor) {
                self.addSublayer(ShapeLinePolygon(points: pathPoints.toCGPoints(), lineWidth: 0.2, color: Colors.darkGreen))
                let p = iGeom.float(point: factor)
                self.addSublayer(ShapeDot(position: p.toCGPoint, radius: 1.0, color: Colors.red))
            } else {
                self.addSublayer(ShapeLinePolygon(points: pathPoints.toCGPoints(), lineWidth: 0.2, color: Colors.darkGray))
            }
        }
        
        for i in 0...n {
            for p in self.points[i] {
                let dot = ShapeDot(position: p.toCGPoint, radius: 1.0, color: Colors.blue)
                self.addSublayer(dot)
            }
        }
    }
    
}


extension HoleScene: MouseCompatible {
    
    private func findNearest(point: Point, points: [[Point]]) -> (Int, Int)? {
        for i in 0..<points.count {
            let path = points[i]
            for j in 0..<path.count {
                let p = path[j]
                let dx = p.x - point.x
                let dy = p.y - point.y
                let r = dx * dx + dy * dy
                if r < 0.2 {
                    return (i, j)
                }
            }
        }
        return nil
    }
    
    
    func mouseDown(point: CGPoint) {
        if let index = findNearest(point: point.point, points: points) {
            self.activeIndex = index
            return
        }
        
        self.activeIndex = nil
    }
    
    
    func mouseUp(point: CGPoint) {
        self.activeIndex = nil
    }
    
    
    func mouseDragged(point: CGPoint) {
        guard let index = self.activeIndex else {
            return
        }
        
        let x = CGFloat(Int(point.x * 2)) / 2
        let y = CGFloat(Int(point.y * 2)) / 2
        
        let point = CGPoint(x: x, y: y).point
        let prevPoint = self.points[index.0][index.1]
        if point != prevPoint {
            self.points[index.0][index.1] = point
            self.update()
        }
    }
}


extension HoleScene: SceneNavigation {
    func next() {
        
    }
    
    func back() {
        
    }
    
    func getName() -> String {
        return "test 0"
    }
}
