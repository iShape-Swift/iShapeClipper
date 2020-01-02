//
//  InnerPointScene.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 28.12.2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Cocoa
import iGeometry
@testable import iShapeClipper

final class InnerPointScene: CoordinateSystemScene {

    private var points: [Point] = [
        Point(x: 0, y: -10),         // A
        Point(x: 5, y: 0),         // B
        Point(x: 0, y: 10),          // C
        Point(x: 10, y: 0)          // D
    ]
    
    private var activeIndex: Int?
    
    
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
        let iPolygon = iGeom.int(points: points)
        
        let point = iGeom.float(point: iPolygon.anyInside(isClockWise: true))

        let dot = ShapeDot(position: point.toCGPoint, radius: 1.0, color: Colors.red)
        
        self.addSublayer(ShapeLinePolygon(points: points.toCGPoints(), lineWidth: 0.2, color: Colors.darkGray))
        self.addSublayer(dot)
    }
    
}


extension InnerPointScene: MouseCompatible {
    
    private func findNearest(point: Point, points: [Point]) -> Int? {
        var i = 0   // skip O point
        while i < points.count {
            let p = points[i]
            let dx = p.x - point.x
            let dy = p.y - point.y
            let r = dx * dx + dy * dy
            if r < 0.2 {
                return i
            }
            
            i += 1
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
        let prevPoint = self.points[index]
        if point != prevPoint {
            self.points[index] = point
            self.update()
        }
    }
}


extension InnerPointScene: SceneNavigation {
    func next() {
        
    }
    
    func back() {
        
    }
    
    func getName() -> String {
        return "test 0"
    }
}
