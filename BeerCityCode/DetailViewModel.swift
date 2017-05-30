//
//  DetailViewModel.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/30/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//


import Foundation

class DetailViewModel {
    
    var user: User!
    
    init(user: User) {
        self.user = user
    }
    
    func getName() -> String {
    
        return user.name ?? ""
    }
    
    func getUsername() -> String {
        
        return user.username ?? ""
    }
    
    func getAddress() -> String {
        let street = user.address?.street ?? ""
        let suite = user.address?.suite ?? ""
        let city = user.address?.city ?? ""
        
        return "\(street)\n\(suite)\n\(city)"
    }
    
    func getLatitude() -> Double {
        return Double.init(user.address?.geo?.lat ?? "42.3314") ?? 42.3314
    }
    
    func getLongitude() -> Double {
        return Double.init(user.address?.geo?.lon ?? "-83.0458") ?? -83.0458
    }
    
    func getPhone() -> String {
        return user.phone ?? ""
    }
    
    func getEmail() -> String {
        return user.email ?? ""
    }
    
    func getWebsite() -> String {
        return user.website ?? ""
    }
    
    
}
