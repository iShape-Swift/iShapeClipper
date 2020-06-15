//
//  MultiUnionScene.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 09.06.2020.
//  Copyright © 2020 iShape. All rights reserved.
//

import Cocoa
import iGeometry
@testable import iShapeClipper

final class MultiUnionScene: CoordinateSystemScene {

    private static let indexKey = String(describing: MultiUnionScene.self)
    private var pageIndex: Int = UserDefaults.standard.integer(forKey: MultiUnionScene.indexKey)


    private var data: MultiUnionTestData.TestData?
    
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
        guard let data = self.data else { return }
        
        var shapes = data.shapes
        
        shapes.union(path: data.path)

        for shape in shapes {
            let layer = PlainShapeLayer(plainShape: shape, fillColor: Colors.complexTest.shapeFill, strokeColor: Colors.complexTest.shapeStroke, lineWidth: 0.25)
            self.addSublayer(layer)
        }

        let pathLayer = PlainShapeLayer(plainShape: PlainShape(points: data.path), fillColor: .clear, strokeColor: Colors.complexTest.slaveStroke, lineWidth: 0.125, dots: true)
        self.addSublayer(pathLayer)
    }
    
    func showPage(index: Int) {
        self.data = MultiUnionTestData.data[index]
        self.update()
    }
    
}


extension MultiUnionScene: MouseCompatible {

    func mouseDown(point: CGPoint) {}
    
    func mouseUp(point: CGPoint) {}
    
    func mouseDragged(point: CGPoint) {}
}

extension MultiUnionScene: SceneNavigation {
    
    func next() {
        let n = MultiUnionTestData .data.count
        self.pageIndex = (self.pageIndex + 1) % n
        UserDefaults.standard.set(pageIndex, forKey: MultiUnionScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func back() {
        let n = MultiUnionTestData.data.count
        self.pageIndex = (self.pageIndex - 1 + n) % n
        UserDefaults.standard.set(pageIndex, forKey: MultiUnionScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func getName() -> String {
        return "test \(self.pageIndex)"
    }
}
