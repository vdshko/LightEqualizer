//
//  RootViewModel.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

final class RootViewModel: ObservableObject {
    
    @Published var selectedColor: Color = Asset.Colors.Base.white.color
    @Published private(set) var isHintShown: Bool = false
    
    var hintOffset: CGSize {
        return CGSize(width: 0.0, height: isHintShown ? 0 : UIScreen.main.bounds.height)
    }
    
    private let brightnessService: BrightnessService = BrightnessServiceImpl()
    
    func onAppear() {
        setupHintTimers()
    }
}

private extension RootViewModel {
    
    func setupHintTimers() {
        let timerBlock: (Timer) -> Void = { [weak self] timer in
            DispatchQueue.main.async {
                withAnimation {
                    self?.isHintShown.toggle()
                }
            }
            timer.invalidate()
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: timerBlock)
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: timerBlock)
    }
}
