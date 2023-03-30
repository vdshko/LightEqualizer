//
//  AppState.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

final class AppState: ObservableObject {
    
    @Published var lightColor: Color = Asset.Colors.Base.white.color
    
    static var shared: AppState = AppState()
    
    private init() {}
}
