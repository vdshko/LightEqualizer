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
            brightnessControl
            flashlightControl
            backgroundColorControl
        }
        .padding(.horizontal, 24.0)
        .padding(.vertical, 32.0)
        .background(
            Asset.Colors.PopUp.background.color
                .cornerRadius(8.0)
        )
        .frame(width: 205.0, height: 550.0)
    }
    
    private var brightnessControl: some View {
        VStack {
            Text(L10n.Controls.Brightness.title)
                .foregroundColor(Asset.Colors.Base.white)
            VerticalSlider(value: $viewModel.brightnessValue)
        }
    }
    
    private var flashlightControl: some View {
        Toggle(L10n.Controls.Flashlight.title, isOn: $viewModel.isFlashlightActive)
            .foregroundColor(Asset.Colors.Base.white)
    }
    
    private var backgroundColorControl: some View {
        ColorPicker(L10n.Controls.BackgroundColor.title, selection: $viewModel.selectedColor, supportsOpacity: false)
            .foregroundColor(Asset.Colors.Base.white)
    }
}

struct ControlsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ControlsView()
    }
}
