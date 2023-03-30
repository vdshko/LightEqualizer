//
//  ControlsViewModel.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI
import Combine

extension ControlsView {
    
    final class ControlsViewModel: ObservableObject {
        
        @Published var brightnessValue: CGFloat = 0.0
        @Published var selectedColor: Color = AppState.shared.lightColor
        @Published var isFlashlightActive: Bool = false
        
        private var cancelBag: Set<AnyCancellable> = Set<AnyCancellable>()
        
        private let brightnessService: BrightnessService = BrightnessServiceImpl()
        
        init() {
            setupBinding()
        }
    }
}

private extension ControlsView.ControlsViewModel {
    
    func setupBinding() {
        brightnessValue = brightnessService.brightness
        isFlashlightActive = brightnessService.isFlashlightActive
        $selectedColor
            .assign(to: &AppState.shared.$lightColor)
        $brightnessValue
            .removeDuplicates()
            .sink { [weak brightnessService] value in
                brightnessService?.adjustBrightness(value: value)
            }
            .store(in: &cancelBag)
        $isFlashlightActive
            .dropFirst()
            .sink { [weak brightnessService] _ in
                try? brightnessService?.toggleFlashLight()
            }
            .store(in: &cancelBag)
    }
}
