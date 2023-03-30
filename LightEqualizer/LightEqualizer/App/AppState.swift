//
//  AppState.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {
    
    @Published var lightColor: Color = Asset.Colors.Base.white.color
    
    static var shared: AppState = AppState()
    
    @AppStorage("lightColorStorage")
    private var lightColorStorage: String = ""
    private var cancelBag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    private init() {
        setupBinding()
    }
    
    private func setupBinding() {
        lightColor = lightColorStorage.toColor ?? Asset.Colors.Base.white.color
        $lightColor
            .dropFirst()
            .sink { [weak self] newColor in
                self?.lightColorStorage = newColor.toString
            }
            .store(in: &cancelBag)
    }
}

private extension Color {
    
    var toString: String {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return "\(red),\(green),\(blue),\(alpha)"
    }
}

private extension String {
    
    var toColor: Color? {
        let rgbArray = components(separatedBy: ",")
        guard let red = Double(rgbArray[0]),
              let green = Double(rgbArray[1]),
              let blue = Double(rgbArray[2]),
              let alpha = Double(rgbArray[3]) else {
            return nil
        }
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
