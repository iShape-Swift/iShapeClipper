//
//  Intersector+Test.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 06/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Cocoa
import iGeometry
@testable import iShapeClipper

struct EdgePath {
    let path: [CGPoint]
    fileprivate let type: PinPoint.PinType
    
    var colors: [CGColor] {
        return IntersectorResult.getColors(type: self.type)
    }
}

struct Pin {
    let point: CGPoint
    fileprivate let type: PinPoint.PinType
    
    var colors: [CGColor] {
        return IntersectorResult.getColors(type: self.type)
    }
}

struct IntersectorResult {
    
    let points: [Pin]
    let path: [EdgePath]
    
    fileprivate static func getColors(type: PinPoint.PinType) -> [CGColor] {
        switch type {

        case .out_in: return [Colors.out, Colors.into]
        case .outside: return [Colors.out, Colors.out]
        case .inside: return [Colors.into, Colors.into]
        case .in_out: return [Colors.into, Colors.out]
        case .null: return [Colors.black, Colors.black]
        }
    }
}

extension CrossDetector {
    
    static func getPins(iMaster: [IntPoint], iSlave: [IntPoint], iGeom: IntGeom, exclusionPinType: PinPoint.PinType) -> IntersectorResult {
        let navigator = CrossDetector.findPins(iMaster: iMaster, iSlave: iSlave, exclusionPinType: exclusionPinType)
        
        var borders = [EdgePath]()
        var points = [Pin]()
        
        for node in navigator.nodeArray {
            if node.marker == 0 {
                let index = node.index
                if node.isPinPath {
                    let path = navigator.pinPathArray[index]
                    let points = path.extract(points: iMaster)
                    let cgPoints = iGeom.float(points: points).toCGPoints()
                    let edgePath = EdgePath(path: cgPoints, type: path.v0.type)
                    borders.append(edgePath)
                } else {
                    let p = navigator.pinPointArray[index]
                    let point = iGeom.float(point: p.point).toCGPoint
                    points.append(Pin(point: point, type: p.type))
                }
            }
            
        }
        
        return IntersectorResult(points: points, path: borders)
    }
}
