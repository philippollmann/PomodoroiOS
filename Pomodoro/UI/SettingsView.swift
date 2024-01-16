//
//  SettingsView.swift
//  Pomodoro
//
//  Created by Philipp Ollmann on 09.01.24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        previewLight()
        previewDark()
    }

    static func previewLight() -> some View {
        return SettingsView()
            .preferredColorScheme(.light)
    }

    static func previewDark() -> some View {
        return SettingsView()
            .preferredColorScheme(.dark)
    }
}
