//
//  RootViewModel.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

final class RootViewModel: ObservableObject {
    
    @Published var selectedColor: Color = Color.white
    
    private let brightnessService: BrightnessService = BrightnessServiceImpl()
}
