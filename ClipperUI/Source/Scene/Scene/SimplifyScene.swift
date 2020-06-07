//
//  SimplifyScene.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 19.04.2020.
//  Copyright © 2020 iShape. All rights reserved.
//


import Cocoa
import iGeometry
@testable import iShapeClipper

final class SimplifyScene: CoordinateSystemScene {
    
    private static let indexKey = String(describing: SimplifyScene.self)

    private var pageIndex: Int = UserDefaults.standard.integer(forKey: SimplifyScene.indexKey)
    private var activeIndex: Int?
    private var points: [IntPoint] = []
    
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
        let data = SimplifyTestData.data[index]
        self.points = data.points
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
        let polygon = IntGeom.defGeom.float(points: self.points)
        let n = polygon.count
        var data = Array<String>(repeating: " ", count: n)
        data.reserveCapacity(n)
        for i in 0..<n {
            data[i] = String(i)
        }
        self.addSublayer(ShapeVectorPolygon(points: polygon.toCGPoints(), shift: 0, tip: 1, lineWidth: 0.25, color: Colors.gray, indexShift: -2, data: data))
        
        var simple = self.points
        
        simple.simplify()
        
        let sPolygon = IntGeom.defGeom.float(points: simple)
        
        self.addSublayer(ShapeLinePolygon(points: sPolygon.toCGPoints(), lineWidth: 0.2, color: Colors.orange))
    }
    
}


extension SimplifyScene: MouseCompatible {
    
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
        let polygon = IntGeom.defGeom.float(points: self.points)
        if let index = findNearest(point: point.point, points: polygon) {
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
        
        let point = IntGeom.defGeom.int(point: CGPoint(x: x, y: y).point)
        let prevPoint = self.points[index]
        
        if point != prevPoint {
            self.points[index] = point
            self.update()
        }
    }
}


extension SimplifyScene: SceneNavigation {
    func next() {
        let n = SimplifyTestData.data.count
        self.pageIndex = (self.pageIndex + 1) % n
        UserDefaults.standard.set(pageIndex, forKey: SimplifyScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func back() {
        let n = SimplifyTestData.data.count
        self.pageIndex = (self.pageIndex - 1 + n) % n
        UserDefaults.standard.set(pageIndex, forKey: SimplifyScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func getName() -> String {
        return "test \(self.pageIndex)"
    }
}
