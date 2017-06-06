//
//  MockData.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/30/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation


struct MockData {
    public static let address = Address.init(street: "1234 Sesame St", suite: "ABC", city: "Detroit", zipcode: "48127")
    
    public static let users: [User] = [
     User.init(userId: 1, name: "Elmo", username: "elmosworld", address: address, email: "elmo@sesamest.com", phone: "123-123-1234", website: "sesamestreet.com"),
     
     User.init(userId: 1, name: "Big Bird", username: "birdysofly", address: address, email: "bigbird@sesamest.com", phone: "123-123-1234", website: "sesamestreet.com"),
     
     User.init(userId: 1, name: "Cookie Monster", username: "cookiesforlyfe", address: address, email: "cookie@sesamest.com", phone: "123-123-1234", website: "sesamestreet.com"),
     
     User.init(userId: 1, name: "Bert", username: "bert", address: address, email: "bert@sesamest.com", phone: "123-123-1234", website: "sesamestreet.com")
    ]
}
