//
//  PlainShapeLayer.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 25.12.2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Cocoa
import iGeometry

final class PlainShapeLayer: CAShapeLayer {
    
    init(plainShape: PlainShape, fillColor: CGColor, strokeColor: CGColor, lineWidth: CGFloat) {
        super.init()
        
        guard !plainShape.layouts.isEmpty else {
            return
        }

        let hullLayout = plainShape.layouts[0]
        let hullPoints = IntGeom.defGeom.float(points: Array(plainShape.points[hullLayout.begin...hullLayout.end])).toCGPoints()
        
        let path = hullPoints.toPath
        
        if plainShape.layouts.count > 1 {
            for i in 1..<plainShape.layouts.count {
                let layout = plainShape.layouts[i]
                let holePoints = IntGeom.defGeom.float(points: Array(plainShape.points[layout.begin...layout.end])).toCGPoints()
                path.addPath(holePoints.toPath)
            }
        }

        self.lineCap = .round
        self.path = path
        self.fillRule = .evenOdd
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth
        self.opacity = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
}

private extension Array where Element == CGPoint {
    
    var toPath: CGMutablePath {
        let path = CGMutablePath()
        path.move(to: self[0])
        for i in 1..<self.count {
            path.addLine(to: self[i])
        }
        path.closeSubpath()
        return path
    }
    
}
