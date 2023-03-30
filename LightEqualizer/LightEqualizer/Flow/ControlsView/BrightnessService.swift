//
//  BrightnessService.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import class UIKit.UIScreen
import AVFoundation
import Combine

protocol BrightnessService: AnyObject {
    
    var brightness: CurrentValueSubject<CGFloat, Never> { get set }
    var isFlashlightActive: Bool { get }
    
    func toggleFlashLight() throws
    func adjustBrightness(value: CGFloat)
}

final class BrightnessServiceImpl: BrightnessService {
    
    var brightness: CurrentValueSubject<CGFloat, Never> = CurrentValueSubject<CGFloat, Never>(UIScreen.main.brightness)
    
    var isFlashlightActive: Bool {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return false }
        return device.hasTorch && device.isTorchActive
    }
    
    private var cancelBag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init() {
        setupBinding()
    }
    
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
    
    func setupBinding() {
        NotificationCenter.default
            .publisher(for: UIScreen.brightnessDidChangeNotification)
            .sink { [weak self] _ in
                self?.brightness.send(UIScreen.main.brightness)
            }
            .store(in: &cancelBag)
    }
}
