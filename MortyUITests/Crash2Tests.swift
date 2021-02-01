//
//  Crash2Tests.swift
//  MortyUITests
//
//  Created by Shams Ahmed on 22/01/2021.
//

import XCTest

final class Crash2Tests: XCTestCase {

    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = true
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: - Test

    func testObjcOutOfBound_crash() throws {
        let app = XCUIApplication()
        app.launch()
        
        sleep(1)
        
        app.tabBars["Tab Bar"].buttons["Episodes"]
            .tap()
        
        app.tables.firstMatch
            .swipeUp()
         
        let navigationBar = app.navigationBars["Episodes"]
        
        navigationBar.staticTexts["Episodes"]
            .tap()
        navigationBar.children(matching: .other)
            .element(boundBy: 0)
            .buttons["💥"]
            .tap()
        
        if app.wait(for: .notRunning, timeout: 1) {
            app.terminate()
        }
    }
    
    func testObjcOutOfBound_relaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Sends crash report
        
        sleep(15)
        
        _ = app.wait(for: .runningForeground, timeout: 5)
    }
    
    func testOutOfBound_crash() throws {
        let app = XCUIApplication()
        app.launch()
        
        sleep(1)
        
        app.tabBars["Tab Bar"].buttons["Episodes"]
            .tap()
        
        app.tables.firstMatch
            .swipeUp()
         
        let navigationBar = app.navigationBars["Episodes"]
        
        navigationBar.staticTexts["Episodes"]
            .tap()
        navigationBar.children(matching: .other)
            .element(boundBy: 1)
            .buttons["💥"]
            .tap()
        
        if app.wait(for: .notRunning, timeout: 1) {
            app.terminate()
        }
    }
    
    func testOutOfBound_relaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Sends crash report
        
        sleep(15)
        
        _ = app.wait(for: .runningForeground, timeout: 5)
    }
}
