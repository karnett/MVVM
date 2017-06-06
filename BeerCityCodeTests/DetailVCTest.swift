//
//  DetailVCTest.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/30/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import XCTest
@testable import BeerCityCode

class DetailVCTest: XCTestCase {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var detailVC: DetailViewController!
    
    var viewModel: DetailViewModel!
    
    override func setUp() {
        super.setUp()
        let user: User = MockData.users[0]
        self.detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as!  DetailViewController ?? DetailViewController()
        
        self.detailVC.setupViewModel(user: user)
        self.viewModel = self.detailVC.viewModel
        let _ = self.detailVC?.view //ensure viewDidLoad gets called
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    

    func testButtonText() {
        XCTAssertTrue(self.detailVC.phoneBtn.titleLabel?.text == self.viewModel.getPhone(), "Phone title should hold phone" )
        
        XCTAssertTrue(self.detailVC.emailBtn.titleLabel?.text == self.viewModel.getEmail(), "Email title should hold email" )
        
        XCTAssertTrue(self.detailVC.websiteBtn.titleLabel?.text == self.viewModel.getWebsite(), "website title should hold website" )
    }    
}
