//
//  User.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/17/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    internal var userId: Int!
    internal var name: String?
    internal var username: String?
    internal var email: String?
    internal var address: Address?
    internal var phone: String?
    internal var website: String?
    internal var company: Company?
    
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    //Init for testing / Mock Data
    //Only use some data for example only. You can build this out more. Or include helper functions (updateAddress(add), etc)
    init(userId: Int, name: String, email: String, address: Address) {
        self.userId = userId
        self.name = name
        self.email = email
        self.address = address
    }
    
    func mapping(map: Map) {
        
        userId      <- map["id"]
        name        <- map["name"]
        username    <- map["username"]
        email       <- map["email"]
        address     <- map["address"]
        phone       <- map["phone"]
        website     <- map["website"]
        company     <- map["company"]
    }
}

/*
 EXPECTING JSON:
 {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {
            "lat": "-37.3159",
            "lng": "81.1496"
        }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
    }
 }*/
