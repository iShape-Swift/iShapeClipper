//
//  ComplexSubtractScene.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 24.12.2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Cocoa
import iGeometry
@testable import iShapeClipper

final class ComplexSubtractScene: CoordinateSystemScene {

    private static let indexKey = String(describing: ComplexSubtractScene.self)
    
    private var shapePoints: [IntPoint] = []
    private var shapeLayouts: [PlainShape.Layout] = []
    private var path: [IntPoint] = []
    
    private var pageIndex: Int = UserDefaults.standard.integer(forKey: ComplexSubtractScene.indexKey)
    
    private var activeIndex: Int?
    private var isPath: Bool = false
    
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
        self.addShape()
        self.addSlave()
        self.addSolution()
    }
    
    private func addSolution() {
        let plainShape = PlainShape(points: self.shapePoints, layouts: self.shapeLayouts)
        let iSlave = self.path
        let solution = plainShape.complexSubtract(path: iSlave)

        if solution.isInteract {
            if !solution.mainList.segments.isEmpty {
                for i in 0..<solution.mainList.segments.count {
                    let shape = solution.mainList.get(index: i)
                    let layer = PlainShapeLayer(plainShape: shape, fillColor: Colors.complexTest.shapeFill, strokeColor: Colors.complexTest.shapeStroke, lineWidth: 0.25)
                    self.addSublayer(layer)
                }
            }
            if !solution.partList.segments.isEmpty {
                for i in 0..<solution.partList.segments.count {
                    let shape = solution.partList.get(index: i)
                    let layer = PlainShapeLayer(plainShape: shape, fillColor: Colors.complexTest.bitFill, strokeColor: Colors.complexTest.bitStroke, lineWidth: 0.25)
                    self.addSublayer(layer)
                }
            }
        }
    }

    private func addShape() {
        let plainShape = PlainShape(points: self.shapePoints, layouts: self.shapeLayouts)
        let layer = PlainShapeLayer(plainShape: plainShape, fillColor: Colors.complexTest.masterFill, strokeColor: Colors.complexTest.masterStroke, lineWidth: 0.125)
        self.addSublayer(layer)
    }
    
    private func addSlave() {
        let plainShape = PlainShape(points: self.path)
        let layer = PlainShapeLayer(plainShape: plainShape, fillColor: Colors.complexTest.slaveFill, strokeColor: Colors.complexTest.slaveStroke, lineWidth: 0.125)
        self.addSublayer(layer)
    }

    func showPage(index: Int) {
        let data = ComplexTestData.data[index]
        self.shapePoints = data.shape.points
        self.shapeLayouts = data.shape.layouts
        self.path = data.path
        self.update()
    }
    
}


extension ComplexSubtractScene: MouseCompatible {
    
    private func findNearest(point: IntPoint, points: [IntPoint]) -> Int? {
        var i = 0
        let radius: Float = 25
        let minRad = IntGeom.defGeom.int(float: radius * radius)
        while i < points.count {
            let p = points[i]
            let dx = p.x - point.x
            let dy = p.y - point.y
            let r = dx * dx + dy * dy
            if r < minRad {
                return i
            }
            
            i += 1
        }
        return nil
    }
    
    
    func mouseDown(point: CGPoint) {
        let point = IntGeom.defGeom.int(point: point.point)
        
        if let index = findNearest(point: point, points: self.path) {
            self.activeIndex = index
            self.isPath = true
            return
        }
        
        if let index = findNearest(point: point, points: self.shapePoints) {
            self.activeIndex = index
            self.isPath = false
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

        let x = Float(Int(point.x * 2)) / 2
        let y = Float(Int(point.y * 2)) / 2

        let point = IntGeom.defGeom.int(point: Point(x: x, y: y))
        if isPath {
            let prevPoint = self.path[index]
            if point != prevPoint {
                self.path[index] = point
                self.update()
            }
        } else {
            let prevPoint = self.shapePoints[index]
            if point != prevPoint {
                self.shapePoints[index] = point
                self.update()
            }
        }
    }
}

extension ComplexSubtractScene: SceneNavigation {
    
    func next() {
        let n = ComplexTestData.data.count
        self.pageIndex = (self.pageIndex + 1) % n
        UserDefaults.standard.set(pageIndex, forKey: ComplexSubtractScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func back() {
        let n = ComplexTestData.data.count
        self.pageIndex = (self.pageIndex - 1 + n) % n
        UserDefaults.standard.set(pageIndex, forKey: ComplexSubtractScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func getName() -> String {
        return "test \(self.pageIndex)"
    }
}
