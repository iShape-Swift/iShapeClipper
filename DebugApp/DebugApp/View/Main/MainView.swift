//
//  MainView.swift
//  DebugApp
//
//  Created by Nail Sharipov on 03.08.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var inputSystem: InputSystem
    @ObservedObject private var contentState: ContentState
    private let sceneState: SceneState

    init(state: ContentState) {
        self.contentState = state
        self.sceneState = SceneState()
    }

    var body: some View {
        
        return GeometryReader { geometry in
            ZStack {
                СoordinateView(state: self.sceneState).background(Color.white)
                self.content(size: geometry.size).allowsHitTesting(false)
            }.gesture(MagnificationGesture()
                .onChanged { scale in
                    self.sceneState.modify(scale: scale)
                }
                .onEnded { scale in
                    self.sceneState.apply(scale: scale)
                })
            .gesture(DragGesture()
                .onChanged { data in
                    self.sceneState.move(start: data.startLocation, current: data.location)
                }
                .onEnded { data in
                    self.sceneState.apply(start: data.startLocation, current: data.location)
                }
            )
        }
    }

    func content(size: CGSize) -> some View {
        self.sceneState.sceneSize = size
        
        let unionScene = UnionSceneView(sceneState: self.sceneState)
        let subtractScene = SubtractSceneView(sceneState: self.sceneState)
        
        let scene: Scene
        
        switch self.contentState.current {
            case .subtract:
                scene = subtractScene.state
            case .union:
                scene = unionScene.state
        }

        self.inputSystem.subscribe(scene)
        self.sceneState.scene = scene
        self.sceneState.reset()
        
        return ZStack {
            unionScene.isHidden(self.contentState.current != .union)
            subtractScene.isHidden(self.contentState.current != .subtract)
        }
    }
    
}
