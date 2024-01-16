//
//  SnapshotTests.swift
//  PomodoroTests
//
//  Created by Philipp Ollmann on 15.01.24.
//

@testable import Pomodoro
import Foundation
import SnapshotTesting
import SwiftUI
import XCTest

final class SnapshotTests: XCTestCase {
    override func setUpWithError() throws {
        
        /**
         Simulator for snapshots needs to be the same for the whole
         project to have the same screen size & device for every snapshot image
         */
        let device = UIDevice.current.name
        let version = UIDevice.current.systemVersion
        if device != "iPhone 15" || version != "17.2" {
            fatalError("Switch to the iPhone 15 (iOS 17.2) simulator.")
        }
        
        UIView.setAnimationsEnabled(false)
        
        // https://stackoverflow.com/questions/68387187/how-to-use-uiwindowscene-windows-on-ios-15
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap { $0 as? UIWindowScene }?.windows
            .first(where: \.isKeyWindow)?.layer.speed = 100
    }
    
    
    func testPomodoroView() {
        assertScreen(view: PomodoroView_Previews.previewLight(), scheme: .dark, name: "PomodoroView")
        assertScreen(view: PomodoroView_Previews.previewDark(), scheme: .light, name: "PomodoroView")
    }
}

extension SnapshotTests {
    enum testColorScheme {
        case light
        case dark
    }

    func assertScreen<Value>(view: Value, scheme: testColorScheme, name: String = #function) where Value: View {
        let precision: Float = 1
        let perceptualPrecision: Float = 0.98
        let isRecording = false
        
        let traitDarkMode = UITraitCollection(userInterfaceStyle: scheme == .dark ? .dark : .light)

        assertSnapshot(
            of: view.toVC(),
            as: .image(
                on: .iPhone13Pro,
                precision: precision,
                perceptualPrecision: perceptualPrecision,
                traits: traitDarkMode
            ),
            record: isRecording,
            testName: "\(name)-\(scheme == .dark ? "dark" : "light")"
        )
    }
}


extension View {
    func toVC() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
