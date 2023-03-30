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
        @Published var isControlsShown: Bool = true
        
        init() {
            setupBinding()
        }
        
        func screenTapped() {
            withAnimation(.linear(duration: 0.3)) {
                isControlsShown.toggle()
            }
        }
    }
}

private extension RootView.RootViewModel {
    
    func setupBinding() {
        AppState.shared.$lightColor
            .receive(on: DispatchQueue.main)
            .assign(to: &$selectedColor)
    }
}
