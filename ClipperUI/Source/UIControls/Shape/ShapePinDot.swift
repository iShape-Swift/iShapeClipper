//
//  ShapePinDot.swift
//  ClipperUI
//
//  Created by Nail Sharipov on 06/10/2019.
//  Copyright © 2019 iShape. All rights reserved.
//

import Cocoa
@testable import iShapeClipper

final class ShapePinDot: CAShapeLayer {
    
    init(pin: Pin, radius: CGFloat) {
        super.init()
        
        let colors = pin.colors

        let point = pin.point
        
        let linePath = CGMutablePath()
        linePath.addEllipse(in: CGRect(x: point.x - 0.5 * radius, y: point.y - 0.5 * radius, width: radius, height: radius))
        
        self.path = linePath
        self.fillColor = colors[0]
        self.strokeColor = colors[1]
        self.lineWidth = 0.3 * radius
        self.opacity = 1.0
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    
}
