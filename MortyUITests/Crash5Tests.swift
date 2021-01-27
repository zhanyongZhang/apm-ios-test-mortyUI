//
//  Crash5Tests.swift
//  MortyUITests
//
//  Created by Shams Ahmed on 22/01/2021.
//

import XCTest

final class Crash5Tests: XCTestCase {

    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = true
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: - Test

    func test_crash() throws {
        let app = XCUIApplication()
        app.launch()
        
        sleep(1)
        
        app.tables.firstMatch
            .swipeUp()
         
        let navigationBar = app.navigationBars["Characters"]
        
        navigationBar.staticTexts["Characters"]
            .tap()
        navigationBar.children(matching: .other)
            .element(boundBy: 0)
            .buttons["💥"]
            .tap()
        
        if app.wait(for: .notRunning, timeout: 1) {
            app.terminate()
        }
    }
    
    func test_relaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Sends crash report
        
        sleep(10)
    }
}
