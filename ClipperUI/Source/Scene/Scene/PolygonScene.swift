//
//  PolygonScene.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 04.11.2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Cocoa
import iGeometry
@testable import iShapeClipper

final class PolygonScene: CoordinateSystemScene {
    
    private static let indexKey = String(describing: PolygonScene.self)

    private var pageIndex: Int = UserDefaults.standard.integer(forKey: PolygonScene.indexKey)
    private var activeIndex: Int?
    private var points: [Point] = []
    
    override init() {
        super.init()
        self.showPage(index: pageIndex)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    func showPage(index: Int) {
        self.points = PolygonPointTestData.data[index].points
        self.update()
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
        
        let polygon = Array(points[0..<points.count - 1])
        let iGeom = IntGeom.defGeom
        let iPolygon = iGeom.int(points: polygon)

        let point = points[points.count - 1]
        let iPoint = iGeom.int(point: point)
        
        let result = iPolygon.isContain(point: iPoint)
        
        let color: CGColor
        if result {
            color = Colors.red
        } else {
            color = Colors.blue
        }
        
        
        let dot = ShapeDot(position: point.toCGPoint, radius: 1.0, color: color)
        
        self.addSublayer(ShapeLinePolygon(points: polygon.toCGPoints(), lineWidth: 0.2, color: Colors.darkGray))
        self.addSublayer(dot)
    }
    
}


extension PolygonScene: MouseCompatible {
    
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


extension PolygonScene: SceneNavigation {
    func next() {
        let n = PolygonPointTestData.data.count
        self.pageIndex = (self.pageIndex + 1) % n
        UserDefaults.standard.set(pageIndex, forKey: PolygonScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func back() {
        let n = PolygonPointTestData.data.count
        self.pageIndex = (self.pageIndex - 1 + n) % n
        UserDefaults.standard.set(pageIndex, forKey: PolygonScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func getName() -> String {
        return "test \(self.pageIndex)"
    }
}
