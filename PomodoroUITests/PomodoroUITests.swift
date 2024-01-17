//
//  PomodoroUITests.swift
//  PomodoroUITests
//
//  Created by Philipp Ollmann on 09.01.24.
//

import XCTest

final class PomodoroUITests: XCTestCase {

    
    private var app: XCUIApplication!
    private let device = XCUIDevice.shared
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    
        app = XCUIApplication()
        app.launch()
        
        // set device to portrait before each test
        device.orientation = .portrait
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        app.terminate() // shut down app
    }
    
    func testPomodoroView() throws {
        device.orientation = .landscapeLeft
        device.orientation = .landscapeRight
        device.orientation = .portraitUpsideDown
        device.orientation = .portrait
        
        let timerTextElement: XCUIElement = app.staticTexts.element(matching: .staticText, identifier: "timeLabel")
        let toggleTimerButton: XCUIElement = app.buttons.element(matching: .button, identifier: "toggleButton")
        
        if timerTextElement.exists, toggleTimerButton.isHittable {
           
            // start Timer
            XCTAssertEqual(timerTextElement.label, "25:00")
            XCTAssertEqual(toggleTimerButton.label, "Start")
            
            sleep(1)
            
            toggleTimerButton.tap()
        
            // check afer 10 seconds
            sleep(10)
            
            XCTAssertEqual(timerTextElement.label, "24:50")
            XCTAssertEqual(toggleTimerButton.label, "Stop")
            
            // stop Timer
            toggleTimerButton.tap()
            
            sleep(1)
            XCTAssertEqual(timerTextElement.label, "25:00")
            XCTAssertEqual(toggleTimerButton.label, "Start")
        }
    }
    
    func testSettingsView() throws {
        let settingsButton: XCUIElement = app.buttons["settingsButton"]
        
        // opening settings view
        settingsButton.tap()
                    
        // Check if the settings screen exists
        let settingsTextElement: XCUIElement = app.staticTexts["settingsLabel"]
        let settingsView = app.otherElements["settingsView"]
        XCTAssertTrue(settingsView.waitForExistence(timeout: 1))
        
        // Check Label
        XCTAssertEqual(settingsTextElement.label, "Hello, World!")
        
        // Dismiss Sheet
        settingsView.swipeDown(velocity: .fast)
        XCTAssertFalse(settingsTextElement.waitForExistence(timeout: 1))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
