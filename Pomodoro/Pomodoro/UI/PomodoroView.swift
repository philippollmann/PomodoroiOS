//
//  ContentView.swift
//  Pomodoro
//
//  Created by Philipp Ollmann on 09.01.24.
//

import SwiftUI
import SwiftData

struct PomodoroView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            VStack {
                Spacer()
                Text("25:00")
                    .font(.system(size: 100))
                    .fontWeight(.bold)
                Spacer()
            }
            .overlay(alignment: .bottom) {
                startButton
                    .padding(.bottom, Spacing.spacing2XL)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Settings", systemImage: "gearshape")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    var startButton: some View {
        Button {
            print("Touched")
        } label: {
            Text("Start")
            .frame(height: 56)
            .padding(.horizontal, Spacing.spacingL)
            .style(.body)
            .background(Color.grayLight)
            .roundedBorder(color: Color.grayDark)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    PomodoroView()
        .modelContainer(for: Item.self, inMemory: true)
}
