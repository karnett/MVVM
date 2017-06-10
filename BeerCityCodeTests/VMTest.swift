//
//  VMTest.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 6/9/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import XCTest
@testable import BeerCityCode

class VMTests: XCTestCase {
    let rest: RestProtocol = MockRestController()
    var viewModel: ViewModel!
    
    override func setUp() {
        super.setUp()
        
        viewModel = ViewModel(restController: rest)
        
        viewModel.loadUsers()
    }
    
    override func tearDown() {
        
        super.tearDown()
        
        print("TEARDOWN assetsVC Test ")
    }
    
    func testUserCount() {
        self.viewModel.loadUsers() //load from mock
        
        XCTAssertEqual(self.viewModel.users.count, self.viewModel.getNumberOfCells(0), "users should be equal to number of cells")
        
        XCTAssertEqual(self.viewModel.getCellTitleForRow(0), "Elmo", "First user should be elmo")
    }
}
