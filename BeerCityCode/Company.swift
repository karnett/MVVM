//
//  Company.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/17/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation
import ObjectMapper

class Company: Mappable {
    
    internal var name: String?
    internal var catchPhrase: String?
    internal var bs: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    init(name: String) {
        self.name = name
    }
    
    func mapping(map: Map) {
        name        <- map["name"]
        catchPhrase <- map["catchPhrase"]
        bs          <- map["bs"]
    }
}
