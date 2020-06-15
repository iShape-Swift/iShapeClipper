//
//  CirclesScene.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 10.06.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import Cocoa
import iGeometry
@testable import iShapeClipper

final class CirclesScene: CoordinateSystemScene {

    private static let indexKey = String(describing: CirclesScene.self)
    
    private var circles: [CircleDefinition] = []

    private var pageIndex: Int = UserDefaults.standard.integer(forKey: CirclesScene.indexKey)
    
    private var activeIndex: Int?
    
    
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
        let maxRadius: Float = 15
        let shapeList = self.circles.union(maxRadius: maxRadius, iGeom: IntGeom.defGeom)

        for i in 0..<shapeList.segments.count {
            let shape = shapeList.get(index: i)
            let layer = PlainShapeLayer(plainShape: shape, fillColor: Colors.complexTest.shapeFill, strokeColor: Colors.complexTest.shapeStroke, lineWidth: 0.25)
            self.addSublayer(layer)
        }
        
        if let index = activeIndex {
            let circle = self.circles[index]
            let plainShape = PlainShape(points: circle.getPath(maxRadius: maxRadius, iGeom: IntGeom.defGeom))
            let layer = PlainShapeLayer(plainShape: plainShape, fillColor: Colors.solution_second, strokeColor: Colors.red, lineWidth: 0.25, dots: false)
            self.addSublayer(layer)
        }
    }
    
    func showPage(index: Int) {
        self.circles = CirclesTestData.data[index]
        self.update()
    }
    
}


extension CirclesScene: MouseCompatible {
    
    private func findNearest(point: Point) -> Int? {
        var i = 0
        while i < circles.count {
            let circle = circles[i]
            let p = circle.center
            let dx = p.x - point.x
            let dy = p.y - point.y
            let r = dx * dx + dy * dy
            if r < circle.radius * circle.radius {
                return i
            }
            
            i += 1
        }
        return nil
    }
    
    
    func mouseDown(point: CGPoint) {
        if let index = findNearest(point: point.point) {
            self.activeIndex = index
            return
        }
        self.activeIndex = nil
    }
    
    
    func mouseUp(point: CGPoint) {
        if activeIndex != nil {
            self.activeIndex = nil
            self.update()
        }
    }
    
    
    func mouseDragged(point: CGPoint) {
        guard let index = self.activeIndex else {
            return
        }

        let x = Float(Int(point.x * 2)) / 2
        let y = Float(Int(point.y * 2)) / 2
        
        let point = Point(x: x, y: y)
        let circle = self.circles[index]
        if point != circle.center {
            self.circles[index].center = point
            self.update()
        }
    }
}

extension CirclesScene: SceneNavigation {
    func next() {
        let n = CirclesTestData.data.count
        self.pageIndex = (self.pageIndex + 1) % n
        UserDefaults.standard.set(pageIndex, forKey: CirclesScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func back() {
        let n = CirclesTestData.data.count
        self.pageIndex = (self.pageIndex - 1 + n) % n
        UserDefaults.standard.set(pageIndex, forKey: CirclesScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func getName() -> String {
        return "test \(self.pageIndex)"
    }
}
