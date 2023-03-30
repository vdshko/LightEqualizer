//
//  HintView.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

struct HintView: View {
    
    @StateObject var viewModel: HintViewModel = HintViewModel()

    var body: some View {
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
                .offset(viewModel.hintOffset)
                .animation(.linear(duration: 2.0), value: viewModel.isHintShown)
                .onTapGesture { [weak viewModel] in
                    viewModel?.hintTapped()
                }
        }
        .onAppear { [weak viewModel] in
            viewModel?.onAppear()
        }
    }
}

struct HintView_Previews: PreviewProvider {
    
    static var previews: some View {
        HintView()
    }
}
