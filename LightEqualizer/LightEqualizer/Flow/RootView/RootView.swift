//
//  RootView.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var viewModel: RootViewModel = RootViewModel()
    
    var body: some View {
        ZStack {
            background
            hint
        }
        .onAppear { viewModel.onAppear() }
    }
    
    private var background: some View {
        viewModel.selectedColor
            .ignoresSafeArea()
    }
    
    private var hint: some View {
        VStack {
            Spacer()
            Text(L10n.PopUp.Hint.title)
                .foregroundColor(Asset.Colors.Base.white.color)
                .padding(.horizontal, 24.0)
                .padding(.vertical, 32.0)
                .background(
                    Asset.Colors.PopUp.background.color
                        .cornerRadius(8.0)
                )
        }
        .offset(viewModel.hintOffset)
        .animation(.linear(duration: 2.0), value: viewModel.isHintShown)
        .allowsHitTesting(false)
    }
}

struct RootView_Previews: PreviewProvider {
    
    static var previews: some View {
        RootView()
    }
}
