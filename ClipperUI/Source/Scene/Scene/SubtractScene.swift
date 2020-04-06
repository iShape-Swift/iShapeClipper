//
//  SubtractScene.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 04/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Cocoa
import iGeometry
@testable import iShapeClipper

final class SubtractScene: CoordinateSystemScene {

    private static let indexKey = String(describing: SubtractScene.self)
    
    private var master: [Point] = []
    private var slave: [Point] = []
    
    private var pageIndex: Int = UserDefaults.standard.integer(forKey: SubtractScene.indexKey)
    
    private var activeIndex: Int?
    private var isSlave: Bool = false
    
    
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
        self.addSolution()
        self.addMaster()
        self.addSlave()
        self.addPins()
    }
    
    private func addSolution() {
        let iGeom = IntGeom.defGeom
        let iMaster = iGeom.int(points: master)
        let iSlave = iGeom.int(points: slave)
        let solution = Solver.subtract(master: iMaster, slave: iSlave, iGeom: iGeom)

        switch solution.nature {
        case .notOverlap:
            let points = master.toCGPoints()
            self.addSublayer(ShapeArea(points: points, color: Colors.master_second))
        default:
            for points in solution.pathList.pathes {
                let points = iGeom.float(points: points).toCGPoints()
                self.addSublayer(ShapeArea(points: points, color: Colors.master_second))
            }
        }
        
        switch solution.nature {
        case .overlap:
            for points in solution.pathList.pathes {
                let points = iGeom.float(points: points).toCGPoints()
                self.addSublayer(ShapeArea(points: points, color: Colors.solution_second))
            }
        case .masterIncludeSlave:
            break
        case .slaveIncludeMaster, .equal:
            self.addSublayer(ShapeArea(points: master.toCGPoints(), color: Colors.solution_second))
        case .notOverlap:
            let points = master.toCGPoints()
            self.addSublayer(ShapeArea(points: points, color: Colors.master_second))
        }
    }
    
    private func addPins() {
        let iGeom = IntGeom.defGeom
        let iMaster = iGeom.int(points: master)
        let iSlave = iGeom.int(points: slave)
        let result = CrossDetector.getPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: .null)
        let points = result.points
        let paths = result.path
        for edgePath in paths {
            let colors = edgePath.colors
            let shape = ShapePath(points: edgePath.path, tip: 1.5, lineWidth: 0.4, color: colors[0], showIndeces: .none, showLast: false, scaleIndeces: 1, data: nil, dash: nil, arrowColor: colors[1])
            self.addSublayer(shape)
        }

        for pin in points {
            self.addSublayer(ShapePinDot(pin: pin, radius: 0.7))
        }
    }
    
    private func addMaster() {
        let n = master.count
        var data = Array<String>(repeating: " ", count: n)
        data.reserveCapacity(n)
        for i in 0..<n {
            data[i] = String(i)
        }
        
        let points = master.toCGPoints()

        self.addSublayer(ShapeVectorPolygon(points: points, shift: 0, tip: 1, lineWidth: 0.25, color: Colors.master, indexShift: -2, data: data))
    }
    
    private func addSlave() {
        let n = slave.count
        var data = Array<String>(repeating: " ", count: n)
        data.reserveCapacity(n)
        for i in 0..<n {
            data[i] = String(i)
        }
        
        let points = slave.toCGPoints()

        self.addSublayer(ShapeArea(points: points, color: Colors.slave_second))
        self.addSublayer(ShapeVectorPolygon(points: points, shift: 0, tip: 1, lineWidth: 0.25, color: Colors.slave, indexShift: 2, data: data))
    }
    
    
    func showPage(index: Int) {
        let data = SubtractTestData.data[index]
        self.master = data[0]
        self.slave = data[1]
        self.update()
    }
    
}


extension SubtractScene: MouseCompatible {
    
    private func findNearest(point: Point, points: [Point]) -> Int? {
        var i = 0
        while i < points.count {
            let p = points[i]
            let dx = p.x - point.x
            let dy = p.y - point.y
            let r = dx * dx + dy * dy
            if r < 0.5 {
                return i
            }
            
            i += 1
        }
        return nil
    }
    
    
    func mouseDown(point: CGPoint) {
        if let index = findNearest(point: point.point, points: slave) {
            self.activeIndex = index
            self.isSlave = true
            return
        }
        
        if let index = findNearest(point: point.point, points: master) {
            self.activeIndex = index
            self.isSlave = false
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
        
        let point = Point(x: x, y: y)
        if isSlave {
            let prevPoint = self.slave[index]
            if point != prevPoint {
                self.slave[index] = point
                self.update()
            }
        } else {
            let prevPoint = self.master[index]
            if point != prevPoint {
                self.master[index] = point
                self.update()
            }
        }
    }
}

extension SubtractScene: SceneNavigation {
    func next() {
        let n = SubtractTestData.data.count
        self.pageIndex = (self.pageIndex + 1) % n
        UserDefaults.standard.set(pageIndex, forKey: SubtractScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func back() {
        let n = SubtractTestData.data.count
        self.pageIndex = (self.pageIndex - 1 + n) % n
        UserDefaults.standard.set(pageIndex, forKey: SubtractScene.indexKey)
        self.showPage(index: self.pageIndex)
    }
    
    func getName() -> String {
        return "test \(self.pageIndex)"
    }
}
