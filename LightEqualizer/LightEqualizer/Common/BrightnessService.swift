//
//  BrightnessService.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import class UIKit.UIScreen
import AVFoundation

protocol BrightnessService {
    
    func toggleFlashLight() throws
    func adjustBrightness(value: CGFloat)
}

final class BrightnessServiceImpl: BrightnessService {
    
    func toggleFlashLight() throws {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video),
                device.hasTorch else { return }
        try device.lockForConfiguration()
        try device.setTorchModeOn(level: 1.0)
        device.torchMode = device.isTorchActive ? .off : .on
        device.unlockForConfiguration()
    }
    
    func adjustBrightness(value: CGFloat) {
        UIScreen.main.brightness = value
    }
}
