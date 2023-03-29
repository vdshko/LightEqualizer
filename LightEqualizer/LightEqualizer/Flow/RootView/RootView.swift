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
            ControlsView()
            HintView()
        }
    }
    
    private var background: some View {
        viewModel.selectedColor
            .ignoresSafeArea()
    }
}

struct RootView_Previews: PreviewProvider {
    
    static var previews: some View {
        RootView()
    }
}
