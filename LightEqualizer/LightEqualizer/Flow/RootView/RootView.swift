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
            message
        }
    }
    
    private var background: some View {
        viewModel.selectedColor
            .ignoresSafeArea()
    }
    
    private var message: some View {
        VStack {
            Spacer()
            ZStack {
                Text(L10n.PopUp.Message.title)
                    .foregroundColor(Asset.Colors.Base.white.color)
                    .padding(.horizontal, 24.0)
                    .padding(.vertical, 32.0)
            }
            .background(
                Asset.Colors.PopUp.background.color
                    .cornerRadius(8.0)
            )
        }
    }
}

struct RootView_Previews: PreviewProvider {
    
    static var previews: some View {
        RootView()
    }
}
