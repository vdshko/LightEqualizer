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
        }
    }
    
    private var background: some View {
        viewModel.selectedColor
            .ignoresSafeArea()
    }
    
    private var message: some View {
        ZStack {
            
        }
        .background(
            RoundedRectangle(cornerRadius: 8.0)
                .background(Asset.PopUp.background.color)
        )
    }
}

struct RootView_Previews: PreviewProvider {
    
    static var previews: some View {
        RootView()
    }
}
