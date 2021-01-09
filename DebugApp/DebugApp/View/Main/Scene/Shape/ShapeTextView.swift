//
//  ShapeTextView.swift
//  DebugApp
//
//  Created by Nail Sharipov on 09.01.2021.
//  Copyright © 2021 Nail Sharipov. All rights reserved.
//

import SwiftUI

struct ShapeTextView: View {

    struct Data {
        let color: Color
        let strokeColor: Color
        let position: CGPoint
        let pin: CGFloat
        let lineWidth: CGFloat
        let text: String

        init(text: String, font: Font, position: CGPoint, pin: CGFloat, lineWidth: CGFloat, color: Color, strokeColor: Color) {
            self.color = color
            self.strokeColor = strokeColor
            self.text = text
            self.position = position
            self.pin = pin
            self.lineWidth = lineWidth
        }
    }
    
    private let data: Data
    @ObservedObject private var sceneState: SceneState

    init(sceneState: SceneState, data: Data) {
        self.sceneState = sceneState
        self.data = data
    }

    var body: some View {
        let screenPoint = sceneState.screen(world: data.position)
        return ZStack {
            Text(data.text).position(screenPoint).foregroundColor(data.color)
        }
    }
}



