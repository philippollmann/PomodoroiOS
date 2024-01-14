//
//  View+Extension.swift
//  HabitTracker
//
//  Created by Philipp Ollmann on 20.08.23.
//

import SwiftUI

//MARK: Custom View modifier
extension View {
    func style(_ font: Font, color: Color = Color.text) -> some View {
        self.modifier(TextStyleModifier(font: font, color: color))
    }
    
    func roundedBorder(radius: CGFloat = 12.0, lineWidth: CGFloat = 1.0, color: Color) -> some View {
        self.modifier(RoundedBorderModifier(topLeading: radius, bottomLeading: radius, topTrailing: radius, bottomTrailing: radius, lineWidth: lineWidth, color: color))
    }
    
    func roundedBorder(topLeading: CGFloat = 12.0, bottomLeading: CGFloat = 12.0, topTrailing: CGFloat = 12.0, bottomTrailing: CGFloat = 12.0, lineWidth: CGFloat = 1.5, color: Color) -> some View {
        self.modifier(RoundedBorderModifier(topLeading: topLeading, bottomLeading: bottomLeading, topTrailing: topTrailing, bottomTrailing: bottomTrailing, lineWidth: lineWidth, color: color))
    }
}

