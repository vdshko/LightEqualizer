//
//  ControlsView.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

struct ControlsView: View {
    
    @StateObject var viewModel: ControlsViewModel = ControlsViewModel()

    var body: some View {
        VStack(spacing: 32.0) {
            VerticalSlider(value: $viewModel.brightnessValue)
            Text("Color")
            ColorPicker("", selection: $viewModel.selectedColor, supportsOpacity: false)
        }
        .padding(.horizontal, 24.0)
        .padding(.vertical, 32.0)
        .background(
            Asset.Colors.PopUp.background.color
                .cornerRadius(8.0)
        )
    }
}

struct ControlsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ControlsView()
    }
}
