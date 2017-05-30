//
//  Utility.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/23/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import Foundation
import UIKit

var restController: RestProtocol = RestController()

enum NotifyName: String {
    case usersLoaded = "usersDataLoaded"
    case usersError = "usersError"
}


//I created a private coocapod with many of these types of functions that I can reuse in every project. 
//Other examples include date mutations and string/number mutations. 
extension UIViewController {
    func sendAlert(title: String, text: String) {
        
        let alert: UIAlertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            alert.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
