//
//  PomodoroCircleIndicator.swift
//  Pomodoro
//
//  Created by Philipp Ollmann on 16.01.24.
//

import SwiftUI

struct PomodoroCircleIndicator: View {
    
    @Binding var amount: Int
    @Binding var completed: Int
    @Binding var running: Bool
    
    var body: some View {
        HStack {
            ForEach(1...amount, id: \.description){ index in
                if running, index == completed + 1 {
                    Image(systemName: "circle.lefthalf.filled")
                } else {
                    Image(systemName: index <= completed ? "circle.fill": "circle")
                }
            }
        }
    }
}

#Preview("Light") {
    PomodoroCircleIndicator(amount: .constant(4), completed: .constant(2), running: .constant(true))
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    PomodoroCircleIndicator(amount: .constant(4), completed: .constant(2), running: .constant(true))
        .preferredColorScheme(.dark)
}
