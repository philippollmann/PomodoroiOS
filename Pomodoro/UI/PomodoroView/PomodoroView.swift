//
//  ContentView.swift
//  Pomodoro
//
//  Created by Philipp Ollmann on 09.01.24.
//

import SwiftUI
import SwiftData

struct PomodoroView: View {
   
    @StateObject  private var model = PomodoroViewModel()
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Spacer()
                Text(model.formattedTime) //TODO: maybe change to switch .formatted()
                    .font(.system(size: 100).monospacedDigit())
                    .fontWeight(.bold)
                    .accessibilityIdentifier("timeLabel")
                PomodoroCircleIndicator()
                Spacer()
                Spacer()
                
                toggleButton
                    .padding(.bottom, Spacing.spacing2XL)
                    .accessibilityIdentifier("toggleButton")
            }
            .padding(Spacing.spacingM)
            .frame(maxWidth: .infinity)
            .background(alignment: .bottom) {
                ZStack {
                    Color.primary.opacity(0.2)
                    GeometryReader(content: { proxy in
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color.backgroundSecondary)
                            .frame(height: proxy.size.height - (proxy.size.height * CGFloat(model.percentageCompleted)))
                            .animation(.easeInOut, value: model.percentageCompleted)
                    })
                }
            }
            .edgesIgnoringSafeArea(.all)
            .toolbar {
                ToolbarItem {
                    Button {
                        model.showSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(Color.text)
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: $model.showSettings) {
            SettingsView()
        }
    }
    
    var toggleButton: some View {
        Button {
            model.togglTimer()
        } label: {
            Text(model.timerRunning ? "Stop" : "Start")
                .frame(height: 56)
                .padding(.horizontal, Spacing.spacingL)
                .style(.body)
                .background(Color.grayLight)
                .roundedBorder(color: Color.grayDark)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct PomodoroView_Previews: PreviewProvider {
    static var previews: some View {
        previewLight()
        previewDark()
    }

    static func previewLight() -> some View {
        return PomodoroView()
            .preferredColorScheme(.light)
    }

    static func previewDark() -> some View {
        return PomodoroView()
            .preferredColorScheme(.dark)
    }
}
