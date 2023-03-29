//
//  VerticalSlider.swift
//  LightEqualizer
//
//  Created by Vladyslav Shkodych on 29.03.2023.
//

import SwiftUI

struct VerticalSlider: View {
    
    @Binding var value: CGFloat
    
    @State private var height: CGFloat = 150.0
    @State private var oldOffset: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Asset.Colors.Base.black.color
                Asset.Colors.Base.white.color
                    .offset(y: height - height * binary(value))
                    .onAppear { height = proxy.size.height }
            }
            .overlay(alignment: .center) { valueOverlay }
        }
        .frame(width: 100.0)
        .cornerRadius(24.0)
        .frame(minHeight: 150.0)
        .gesture(drag)
    }
    
    private var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                let locationY: CGFloat = min(max(gesture.location.y, 0), height)
                let offset: CGFloat = gesture.startLocation.y - locationY
                let nextValue: CGFloat = binary(value) + (offset - oldOffset) / height
                oldOffset = offset
                value = binary(nextValue)
            }
            .onEnded { _ in oldOffset = 0.0 }
    }
    
    private var valueOverlay: some View {
        Text("\(Int(binary(value) * 100))%")
            .foregroundColor(Asset.Colors.Base.white)
            .frame(width: 60.0, height: 30.0)
            .background(
                Asset.Colors.PopUp.background.color
                    .cornerRadius(8.0)
            )
    }
    
    private func binary(_ value: CGFloat) -> CGFloat {
        return min(max(0.0, value), 1)
    }
}

struct VerticalSlider_Previews: PreviewProvider {
    
    static var previews: some View {
        VerticalSlider(value: .constant(0.78))
            .frame(maxWidth: .infinity)
            .background(Asset.Colors.PopUp.background.color)
    }
}
