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
    fileprivate let type: Int
    
    var colors: [CGColor] {
        return IntersectorResult.getColors(type: self.type)
    }
}

struct Pin {
    let point: CGPoint
    fileprivate let type: Int
    
    var colors: [CGColor] {
        return IntersectorResult.getColors(type: self.type)
    }
}

struct IntersectorResult {
    
    let points: [Pin]
    let path: [EdgePath]
    
    fileprivate static func getColors(type: Int) -> [CGColor] {
        switch type {
            case -2: return [Colors.out, Colors.into]
            case -1: return [Colors.out, Colors.out]
            case 1: return [Colors.into, Colors.into]
            case 2: return [Colors.into, Colors.out]
            default: return [Colors.black, Colors.black]
        }
    }
}

extension Intersector {
    
    static func getPins(iMaster: [IntPoint], iSlave: [IntPoint], iGeom: IntGeom, exclusionPinType: Int) -> IntersectorResult {
        let navigator = Intersector.findPins(iMaster: iMaster, iSlave: iSlave, iGeom: iGeom, exclusionPinType: exclusionPinType)
        
        var borders = [EdgePath]()
        var points = [Pin]()
        
        for node in navigator.nodeArray {
            if node.marker == 0 {
                let index = node.index
                if node.isPinPath == 1 {
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
