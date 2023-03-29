//
//  HintViewModel.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

extension HintView {
    
    final class HintViewModel: ObservableObject {
        
        @Published private(set) var isHintShown: Bool = false
        
        var hintOffset: CGSize {
            return CGSize(width: 0.0, height: isHintShown ? 0 : UIScreen.main.bounds.height)
        }
        
        private var hideTimer: Timer?
        
        func onAppear() {
            setupTimers()
        }
        
        func hintTapped() {
            hideTimer?.fire()
        }
    }
}

private extension HintView.HintViewModel {
    
    func setupTimers() {
        let timerBlock: (Timer) -> Void = { [weak self] timer in
            DispatchQueue.main.async {
                withAnimation {
                    self?.isHintShown.toggle()
                }
            }
            timer.invalidate()
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: timerBlock) // show hint
        hideTimer = Timer.scheduledTimer(withTimeInterval: 6.0, repeats: false, block: timerBlock)
    }
}
