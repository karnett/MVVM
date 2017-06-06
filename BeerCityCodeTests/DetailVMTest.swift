//
//  DetailVMTest.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/30/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import XCTest
@testable import BeerCityCode

class DetailVMTests: XCTestCase {
    let rest = MockRestController()
    let user: User = MockData.users[0]
    var viewModel: DetailViewModel!
    
    override func setUp() {
        super.setUp()
        
        viewModel = DetailViewModel(user: user)
        
    }
    
    override func tearDown() {
        
        super.tearDown()
        
        print("TEARDOWN assetsVC Test ")
    }
    
    func testNoMutations() {
        
        XCTAssertEqual(user.name, self.viewModel.getName(), "getName should not mutate data")
        XCTAssertEqual(user.username, self.viewModel.getUsername(), "getUsername should not mutate data")
        XCTAssertEqual(user.phone, self.viewModel.getPhone(), "getPhone should not mutate data")
        XCTAssertEqual(user.email, self.viewModel.getEmail(), "getPhone should not mutate data")
        XCTAssertEqual(user.website, self.viewModel.getWebsite(), "getPhone should not mutate data")
    }
    
    func testMutations() {
        
        XCTAssertTrue(self.viewModel.getAddress().contains((user.address?.street)!), "Address should contain street")
        XCTAssertTrue(self.viewModel.getAddress().contains((user.address?.city)!), "Address should contain city")
        XCTAssertTrue(self.viewModel.getAddress().contains((user.address?.zipcode)!), "Address should contain zip")
        
        XCTAssertFalse(self.viewModel.getAddress().contains((user.address?.suite)!), "Address should NOT contain suite")
        
        XCTAssertTrue(self.viewModel.getAddress().contains("\n"), "Address should span more than 1 line")
        
        //test default value being returned lat / lon since mock data has no value defined
        
        XCTAssertEqual(self.viewModel.getLatitude(), 42.3314, "Latitude should return default value")
        XCTAssertEqual(self.viewModel.getLongitude(), -83.0458, "Latitude should return default value")
    }
}
