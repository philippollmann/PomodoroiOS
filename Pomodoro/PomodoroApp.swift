//
//  PomodoroApp.swift
//  Pomodoro
//
//  Created by Philipp Ollmann on 09.01.24.
//

import SwiftUI
import SwiftData

@main
struct PomodoroApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            PomodoroView()
        }
        .modelContainer(sharedModelContainer)
    }
}
