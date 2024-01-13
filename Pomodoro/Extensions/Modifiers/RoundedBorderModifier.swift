//
//  RoundedBorderModifier.swift
//  HabitTracker
//
//  Created by Philipp Ollmann on 24.08.23.
//

import SwiftUI

struct RoundedBorderModifier: ViewModifier {
    
    let topLeading: CGFloat
    let bottomLeading: CGFloat
    let topTrailing: CGFloat
    let bottomTrailing: CGFloat
    let lineWidth: CGFloat
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .overlay(
                UnevenRoundedRectangle(topLeadingRadius: topLeading, bottomLeadingRadius: bottomLeading, bottomTrailingRadius: bottomTrailing, topTrailingRadius: topTrailing)
                    .stroke(color, lineWidth: lineWidth)
            )
    }
}

#Preview {
    Text("Test")
        .roundedBorder(topLeading: 8, color: .red)
}


