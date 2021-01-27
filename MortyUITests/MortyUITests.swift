//
//  MortyUITests.swift
//  MortyUITests
//
//  Created by Shams Ahmed on 22/01/2021.
//

import XCTest

final class MortyUITests: XCTestCase {

    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = true
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: - Test

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        sleep(10)
    }

    func testLaunch_performance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
