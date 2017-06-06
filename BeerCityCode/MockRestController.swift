//
//  MockRestController.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/30/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation

class MockRestController: RestProtocol {
    
    func getUsers(completionHandler: @escaping (Result<[User]>) -> Void) {
        
        completionHandler(Result.Success(MockData.users))
    }
}
