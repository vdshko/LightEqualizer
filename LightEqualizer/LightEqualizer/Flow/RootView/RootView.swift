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
        ZStack(alignment: .trailing) {
            background
            title
            controls
            hint
        }
    }
    
    private var title: some View {
        VStack {
            HStack {
                Spacer(minLength: 0.0)
                Text(L10n.Root.title)
                    .foregroundColor(Asset.Colors.Base.white)
                    .font(.title)
                    .bold()
                    .padding(8.0)
                    .background(
                        Asset.Colors.PopUp.background.color
                            .cornerRadius(8.0)
                    )
                Spacer(minLength: 0.0)
            }
            .padding(.top, 32.0)
            Spacer()
        }
        .opacity(viewModel.isControlsShown ? 1.0 : 0.0)
    }
    
    private var background: some View {
        viewModel.selectedColor
            .onTapGesture { [weak viewModel] in viewModel?.screenTapped() }
            .ignoresSafeArea()
    }
    
    private var controls: some View {
        ControlsView()
            .padding(.trailing, 24.0)
            .opacity(viewModel.isControlsShown ? 1.0 : 0.0)
    }
    
    private var hint: some View {
        HStack {
            Spacer(minLength: 0.0)
            HintView()
            Spacer(minLength: 0.0)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    
    static var previews: some View {
        RootView()
    }
}
