//
//  PomodoroViewModel.swift
//  Pomodoro
//
//  Created by Philipp Ollmann on 09.01.24.
//

import Foundation
import SwiftUI

@Observable
class PomodoroViewModel: ObservableObject {
    
    var counter = 0
    var timer: Timer? = nil
    var timerRunning: Bool = false
    var showSettings: Bool = false
    
    var percentageCompleted: Float {
        print("Counter: \(counter)")
        return 1 - Float(counter) / Float(startTime)
    }
    
    var formattedTime: String {
        let minutes = counter / 60
        let remainingSeconds = counter % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
    
    private let startTime = 60 * 25
    
    init(){
        counter = startTime
    }
    
    func togglTimer(){
        timerRunning ? stopTimer() : startTimer()
    }
    
    private func startTimer() {
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.counter > 0 {
                self.counter -= 1
            } else {
                self.stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        timerRunning = false
        timer?.invalidate()
        timer = nil
        counter = startTime
    }
}
