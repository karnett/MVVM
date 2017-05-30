//
//  Result.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/17/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation

enum Result<T> {
    case Success(T)
    case Error(MyError)
}


//Bonus - I'm happy with my custom error. Check it. But in the real world I have this in a private cocoapod that contains all my custom-utility work. ✌️
struct MyError : Error
{
    public var code: Int = -1
    public var message: String = "Unknown error occurred."
    
    public init(code: Int, message: String)
    {
        self.code = code
        self.message = message
    }
}

