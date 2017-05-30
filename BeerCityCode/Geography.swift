//
//  Geography.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/17/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//


import Foundation
import ObjectMapper

class Geography: Mappable {
    
    internal var lat: String?
    internal var lon: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    //no init not testing geo
    
    func mapping(map: Map) {
        lat         <- map["lat"]
        lon         <- map["lon"]
    }
}
