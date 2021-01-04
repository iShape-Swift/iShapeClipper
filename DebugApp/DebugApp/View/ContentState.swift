//
//  ContentState.swift
//  DebugApp
//
//  Created by Nail Sharipov on 06.08.2020.
//  Copyright © 2020 Nail Sharipov. All rights reserved.
//

import SwiftUI

final class ContentState: ObservableObject {
    
    enum Test: String, CaseIterable {
        case subtract
        case union
    }
    
    @Published var current: Test = .subtract
}
