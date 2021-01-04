//
//  DirectedPathView.swift
//  DebugApp
//
//  Created by Nail Sharipov on 13.08.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import SwiftUI
import iGeometry

struct DirectedPathView: View {

    private struct Vector {
        let arrowColor: Color
        let strokeColor: Color
        let arrowPoints: [CGPoint]
        
        init(start: CGPoint, end: CGPoint, tip: CGFloat, arrowColor: Color, strokeColor: Color) {
            self.arrowColor = arrowColor
            self.strokeColor = strokeColor
            
            let angle = atan2(end.y - start.y, end.x - start.x)
            let angleLeft = angle + CGFloat.pi * 9 / 10
            let angleRight = angle - CGFloat.pi * 9 / 10
            
            let leftPoint = end + CGPoint(radius: tip, angle: angleLeft)
            let rightPoint = end + CGPoint(radius: tip, angle: angleRight)
            
            self.arrowPoints = [leftPoint, end, rightPoint]
            
            let rightLine = ShapeLine(start: rightPoint, end: end, lineWidth: lineWidth, strokeColor: arrowColor)
            rightLine.lineCap = .round
            self.addSublayer(rightLine)
        }
    }
    
    
    private let points: [CGPoint]
    private let stroke: Color
    private let lineWidth: CGFloat
    private let index: Int
    private let shift: CGFloat
    private let tip: CGFloat
    private let indexShift: CGFloat
    private let data: [String]?
    @ObservedObject private var sceneState: SceneState

    init(sceneState: SceneState, points: [CGPoint], tip: CGFloat, shift: CGFloat, indexShift: CGFloat, data: [String]?, stroke: Color = .gray, lineWidth: CGFloat = 1) {
        self.sceneState = sceneState
        self.points = points
        self.tip = tip
        self.shift = shift
        self.indexShift = indexShift
        self.data = data
        self.stroke = stroke
        self.lineWidth = lineWidth
        
    }

    var body: some View {
        let screenPoints = self.sceneState.screen(world: points)
        
        let n = screenPoints.count
        var normal = DirectedPathView.normal(a: screenPoints[n - 2], b: screenPoints[n - 1], c: screenPoints[0])
        var start = screenPoints[n - 1] + self.shift * normal
        
        for i in 0..<n {
            let a = screenPoints[(i - 1 + n) % n]
            let b = screenPoints[i]
            let c = screenPoints[(i + 1) % n]
            normal = DirectedPathView.normal(a: a, b: b, c: c)
            let end = b + self.shift * normal
            
            self.addSublayer(ShapeVector(start: start, end: end, tip: tip, lineWidth: lineWidth, strokeColor: color, arrowColor: color))
            start = end
            
            if let data = data {
                let fontPoint = b + indexShift * normal
                let text = data[i]
                
                let shapeText = ShapeText(text: text, font: font, position: fontPoint, pin: b, lineWidth: 0.1, color: NSColor.black.cgColor, strokeColor: Colors.lightGray)
                
                self.addSublayer(shapeText)
            }
        }
        
        
        
        
        
        
        
        return ZStack {
            Path { path in
                path.addLines(screenPoints)
                path.closeSubpath()
            }.strokedPath(.init(lineWidth: self.lineWidth)).foregroundColor(self.stroke)
            Text("\(index)").foregroundColor(self.stroke).position(screenPoints.center)
        }
    }
    
    
    private static func normal(a: CGPoint, b: CGPoint, c: CGPoint) -> CGPoint {
        guard (b - a).magnitude > 0.00000000000000000001 && (c - b).magnitude > 0.00000000000000000001 else {
            return CGPoint(x: 1, y: 0)
        }
        let ab = (b - a).normalize
        let bc = (c - b).normalize

        let abN = CGPoint(x: ab.y, y: -ab.x)
        let bcN = CGPoint(x: bc.y, y: -bc.x)
        
        let sum = abN + bcN
        if sum.magnitude < 0.00000000000000000001 {
            return CGPoint(x: -ab.x, y: -ab.y)
        }
        
        return sum.normalize
    }
}
