//
//  TextStyleModifier.swift
//  HabitTracker
//
//  Created by Philipp Ollmann on 20.08.23.
//

import Foundation
import SwiftUI

struct TextStyleModifier: ViewModifier {
    let font: Font
    let color: Color
    
    func body(content: Content) -> some View {
            content
                .font(font)
                .foregroundColor(color)
    }
}

struct TextStyleModifier_Previews: PreviewProvider {
    static var previews: some View {
            Text("Test")
            .style(.body, color: Color.text)
    }
}
