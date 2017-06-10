//
//  BeerCityCodeUITests.swift
//  BeerCityCodeUITests
//
//  Created by Kim Arnett on 5/17/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import XCTest

class BeerCityCodeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        
        let app = XCUIApplication()
        
        continueAfterFailure = false
        
        app.launchArguments.append("UITESTING") //send argument to initialize mockdata
        app.launch()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFlow() {
        
        
        
        
        let app = XCUIApplication()
        app.tables.staticTexts["Elmo"].tap()
        
        //Throw in wait for screen transition and object we're expecting to change.
        self.wait(5.0, object: app.navigationBars["Elmo"])
        XCTAssertTrue( app.navigationBars["Elmo"].exists, "Navigation bar should have User's name")
        
        
        //assert buttons exist
        XCTAssertTrue( app.buttons["Email User"].exists, "Email button should exist")
        XCTAssertTrue( app.buttons["Call User"].exists, "Call button should exist")
        XCTAssertTrue( app.buttons["Visit User's Website"].exists, "Website button should exist")
        

        
        app.buttons["Email User"].tap()
        //XCTASSERT Action
        
        app.buttons["Call User"].tap()
        //XCTASSERT Action
        
        app.buttons["Visit User's Website"].tap()
        //XCTASSERT Action
        
        XCTAssertTrue(app.navigationBars["Elmo"].buttons["Users"].exists, "Back button should say Users")
        app.navigationBars["Elmo"].buttons["Users"].tap()
        
        
        //Throw in wait for screen transition and object we're expecting to change.
        self.wait(5.0, object: app.navigationBars["Users"])
        XCTAssertTrue( app.navigationBars["Users"].exists, "Navigation bar should have User's name")
        
        
        
    }
    
    
    //HELPER METHODS FOR UNIT TESTING.
    func wait(_ duration: TimeInterval, object: XCUIElement)
    {
        
        //waits for condition to be met when changing views before continuing tests.
        _ = self.expectation(
            for: NSPredicate(format: "exists == 1"),
            evaluatedWith: object,
            handler: nil)
        self.waitForExpectations(timeout: duration, handler: nil)
    }
    
    func wait(_ duration: TimeInterval, object: XCUIElementQuery, count: Int)
    {
        //waits for condition to be met when changing views before continuing tests.
        _ = self.expectation(
            for: NSPredicate(format: "self.count = \(count)"),
            evaluatedWith: object,
            handler: nil)
        self.waitForExpectations(timeout: duration, handler: nil)
    }
    
}
