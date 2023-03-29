//
//  ControlsViewModel.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

extension ControlsView {
    
    final class ControlsViewModel: ObservableObject {
        
        @Published var brightnessValue: CGFloat = 0.0
        @Published var selectedColor: Color = AppState.shared.lightColor
        
        init() {
            setupBinding()
        }
    }
}

private extension ControlsView.ControlsViewModel {
    
    func setupBinding() {
        $selectedColor
            .assign(to: &AppState.shared.$lightColor)
    }
}
