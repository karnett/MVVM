//
//  RestProtocol.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/17/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation
protocol RestProtocol
{
    //get list of users
    func getUsers(completionHandler: @escaping (Result<[User]>) -> Void)
}
