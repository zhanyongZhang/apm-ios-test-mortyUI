//
//  Crash4Tests.swift
//  MortyUITests
//
//  Created by Shams Ahmed on 22/01/2021.
//

import XCTest

final class Crash4Tests: XCTestCase {

    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = true
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: - Test

    func testBackgroundThread_crash() throws {
        let app = XCUIApplication()
        app.launch()
    
        sleep(1)
        
        app.tabBars["Tab Bar"].buttons["Locations"]
            .tap()
        
        let table = app.tables.firstMatch
        table.swipeUp()
        table.swipeUp()
        table.swipeDown()
        
        let cell = table.cells.firstMatch
        cell.tap()
        
        let navigationBar = app.navigationBars["Earth (C-137)"]
        navigationBar.staticTexts["Earth (C-137)"]
            .tap()
        
        sleep(1)
        
        navigationBar.buttons["💥"].tap()
        
        if app.wait(for: .notRunning, timeout: 1) {
            app.terminate()
        }
    }
    
    func testBackgroundThread_relaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Sends crash report
        
        sleep(10)
    }
    
    func testMainThread_crash() throws {
        let app = XCUIApplication()
        app.launch()
        
        sleep(1)
        
        let table = app.tables.firstMatch
        table.swipeUp()
        table.swipeUp()
        table.swipeDown()
        table.swipeDown()
         
        sleep(1)
        
        table.buttons.firstMatch.tap()
        
        sleep(1)
        
        let navigationBar = app.navigationBars["Rick Sanchez"]
        
        navigationBar.staticTexts["Rick Sanchez"]
            .tap()
        navigationBar.children(matching: .other)
            .element(boundBy: 0)
            .buttons["💥"]
            .tap()
        
        if app.wait(for: .notRunning, timeout: 1) {
            app.terminate()
        }
    }
    
    func testMainThread_relaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Sends crash report
        
        sleep(10)
    }
}
