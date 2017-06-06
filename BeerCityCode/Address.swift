//
//  Address.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/17/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation
import ObjectMapper

class Address: Mappable {
    
    internal var street: String?
    internal var suite: String?
    internal var city: String?
    internal var zipcode: String?
    internal var geo: Geography?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    //Init for testing purposes]
    init(street: String, suite: String, city: String, zipcode: String) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
    }
    
    func mapping(map: Map) {
        street      <- map["street"]
        suite       <- map["suite"]
        city        <- map["city"]
        zipcode     <- map["zipcode"]
        geo         <- map["geo"]
    }
}
