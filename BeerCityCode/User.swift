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
    init(userId: Int, name: String, username: String, address: Address, email: String, phone: String, website: String) {
        self.userId = userId
        self.username = username
        self.name = name
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
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
