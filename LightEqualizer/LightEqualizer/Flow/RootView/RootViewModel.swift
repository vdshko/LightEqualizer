//
//  RootViewModel.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

extension RootView {
    
    final class RootViewModel: ObservableObject {
        
        @Published var selectedColor: Color = Asset.Colors.Base.white.color
        
        private let brightnessService: BrightnessService = BrightnessServiceImpl()
    }
}
