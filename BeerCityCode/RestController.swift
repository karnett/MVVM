//
//  RestController.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/17/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation

import ObjectMapper
import AlamofireDomain

class RestController: RestProtocol {
    
    
    let url = "https://jsonplaceholder.typicode.com/users"
    
    func getUsers(completionHandler: @escaping (Result<[User]>) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        AlamofireDomain.request(url, method: .get).responseJSON(completionHandler: {response in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch response.result {
                case .success(let data):
                    var users: [User] = []
                    let data = data as? [[String: Any]] ?? []
                    for dict in data {
                        
                        let user = Mapper<User>().map(JSON: dict)
                        print(user)
                        users.append(user!)
                        
                    }
                    
                    completionHandler(Result.Success(users))
                    
                case .failure(let error):
                    let hpError = MyError(code: 601, message: error.localizedDescription)
                    completionHandler(Result.Error(hpError))
             }
        })
    }
}
