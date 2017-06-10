//
//  ViewController.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/17/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: ViewModel!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    let reuseIdentifier = "basicCell"
    let segueIdentifier = "loadUser"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup viewModel that contains our logic
        viewModel = ViewModel.init(restController: restController)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        activityIndicator.startAnimating()
        
        //setup notifications to retreive data loaded/failed. 
        //Doing this to make sure we have heard back from the webservice.
        addNotifications()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if self.viewModel.getSelectedUser() != nil {
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            if let user = self.viewModel.getSelectedUser() {
                detailVC.setupViewModel(user: user)
            }
        }
    }
    
    func addNotifications() {
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: NotifyName.usersError.rawValue), object: nil, queue: nil, using: errorOccurred)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: NotifyName.usersLoaded.rawValue), object: nil, queue: nil, using: dataLoaded)
    }
    
    func errorOccurred(notification: Notification) {
        if let error = notification.object as? MyError {
            self.sendAlert(title: "Error", text: "\(error.message) - \(error.code)")
        }
    }
    
    func dataLoaded(notification: Notification) {
        self.tableView.reloadData()
        activityIndicator.stopAnimating()
    }
    
    //Mark: Table View Delegate / DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfCells(section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)!
        cell.textLabel?.text = self.viewModel.getCellTitleForRow(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.selectedIndex = indexPath
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}
