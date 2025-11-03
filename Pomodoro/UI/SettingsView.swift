//
//  SettingsView.swift
//  Pomodoro
//
//  Created by Philipp Ollmann on 09.01.24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("Settings View")
                .accessibilityIdentifier("settingsLabel")
        }
        .accessibilityIdentifier("settingsView")
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
