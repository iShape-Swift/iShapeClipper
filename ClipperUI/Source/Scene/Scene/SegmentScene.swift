//
//  SegmentScene.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 14.01.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import Cocoa
import iGeometry
@testable import iShapeClipper

final class SegmentScene: CoordinateSystemScene {

    private static let indexKey = String(describing: SegmentScene.self)
    
    private var points: [Point] = []
    
    private var activeIndex: Int?
    private var pageIndex: Int = UserDefaults.standard.integer(forKey: SegmentScene.indexKey)
    
    override init() {
        super.init()
        self.showPage(index: pageIndex)
        self.addShapes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    func showPage(index: Int) {
        self.points = SegmentTestsData.data[index]
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
        let cgPoints = points.toCGPoints()
        self.addSublayer(ShapeVector(start: cgPoints[0], end: cgPoints[1], tip: 1.5, lineWidth: 0.25, strokeColor: Colors.darkBlue, arrowColor: Colors.darkBlue))
        self.addSublayer(ShapeVector(start: cgPoints[2], end: cgPoints[3], tip: 1.5, lineWidth: 0.25, strokeColor: Colors.darkGreen, arrowColor: Colors.darkGreen))
        
        let iPoints = IntGeom.defGeom.int(points: points)
        
        var iCross = IntPoint.zero
        var dp = DPoint.zero
        let crossType = CrossResolver.defineType(a0: iPoints[0], a1: iPoints[1], b0: iPoints[2], b1: iPoints[3], cross: &iCross, dp: &dp)
        
        
        switch crossType {
            
        case .not_cross:
            print("not_cross")
        case .same_line:
            print("same_line")
        case .pure:
            print("pure")
        case .end_a0:
            print("end_a0")
        case .end_a1:
            print("end_a1")
        case .end_b0:
            print("end_b0")
        case .end_b1:
            print("end_b1")
        case .end_a0_b0:
            print("end_a0_b0")
        case .end_a0_b1:
            print("end_a0_b1")
        case .end_a1_b0:
            print("end_a1_b0")
        case .end_a1_b1:
            print("end_a1_b1")
        }
        
        switch crossType {
        case .same_line, .not_cross:
            break
        default:
            let cross = IntGeom.defGeom.float(point: iCross)
            self.addSublayer(ShapeDot(position: cross.toCGPoint, radius: 1.0, color: Colors.red))
        }
    }
    
}


extension SegmentScene: MouseCompatible {
    
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


extension SegmentScene: SceneNavigation {
    func next() {
        let n = SegmentTestsData.data.count
        self.pageIndex = (self.pageIndex + 1) % n
        UserDefaults.standard.set(pageIndex, forKey: SegmentScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func back() {
        let n = SegmentTestsData.data.count
        self.pageIndex = (self.pageIndex - 1 + n) % n
        UserDefaults.standard.set(pageIndex, forKey: SegmentScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func getName() -> String {
        return "test \(self.pageIndex)"
    }
}
