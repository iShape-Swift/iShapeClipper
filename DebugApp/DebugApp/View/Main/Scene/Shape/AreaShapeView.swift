//
//  AreaShapeView.swift
//  DebugApp
//
//  Created by Nail Sharipov on 09.01.2021.
//  Copyright © 2021 Nail Sharipov. All rights reserved.
//

import SwiftUI

struct AreaShapeView: View {

    private let points: [CGPoint]
    private let color: Color
    @ObservedObject private var sceneState: SceneState

    init(sceneState: SceneState, points: [CGPoint], color: Color) {
        self.sceneState = sceneState
        self.color = color
        self.points = points
    }

    var body: some View {
        let screenPoints = sceneState.screen(world: points)
        return ZStack {
            Path { path in
                path.addLines(screenPoints)
                path.closeSubpath()
            }.fill(self.color)
        }
    }
}
