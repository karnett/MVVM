//
//  ViewModel.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/23/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation

class ViewModel {
    
    let rest: RestProtocol!
    
    var users: [User] = []
    var selectedIndex: IndexPath?
    
    init(restController: RestProtocol) {
        self.rest = restController
    
        loadUsers()
    }
    
    func loadUsers() {
        self.rest.getUsers(completionHandler: {data in
            switch data {
                case .Success(let response):
                    
                    self.users = response
                    NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: NotifyName.usersLoaded.rawValue), object: nil)
                
                case .Error(let error):
                    print(error)
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotifyName.usersError.rawValue), object: error)
            }
            
        })
    }
    
    func getSelectedUser() -> User? {
        if selectedIndex != nil && selectedIndex != nil {
            return users[selectedIndex!.row]
        }
        return nil
    }
    
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getNumberOfCells(_ section: Int) -> Int {
        return self.users.count
    }
    
    func getCellTitleForRow(_ row: Int) -> String {
        return self.users[row].name ?? "Unavailable"
    }
    
    
}
