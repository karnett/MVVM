//
//  DetailViewController.swift
//  BeerCityCode
//
//  Created by Kim Arnett on 5/26/17.
//  Copyright © 2017 HPE USPS Mobility. All rights reserved.
//
import UIKit
import Foundation
import MapKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel!
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var emailBtn: UIButton!
    @IBOutlet var phoneBtn: UIButton!
    @IBOutlet var websiteBtn: UIButton!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.navigationItem.title = self.viewModel.getName()        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //needs to be called in prepareforsegue
    func setupViewModel(user: User) {
        viewModel = DetailViewModel.init(user: user)
    }
    
    func loadData(){
        self.usernameLabel.text = self.viewModel.getUsername()
        
        self.emailBtn.setTitle(self.viewModel.getEmail(), for: .normal)
        self.phoneBtn.setTitle(self.viewModel.getPhone(), for: .normal)
        self.websiteBtn.setTitle(self.viewModel.getWebsite(), for: .normal)
        
        self.addressLabel.text = self.viewModel.getAddress()
        
        //center map
        let mapCenter = CLLocationCoordinate2D(latitude: self.viewModel.getLatitude(), longitude: self.viewModel.getLongitude())
        let region = MKCoordinateRegion(center: mapCenter, span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
        self.mapView.setRegion(region, animated: true)
    }
    
    @IBAction func handleContactAction(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                //email tag
                self.emailUser()
            case 1:
                //phone tag
                self.phoneUser()
            case 2:
                //website tag
                self.openWebsite()
            default:
                //ignore action
                return
        }
    }
    
    func emailUser() {
        print("Pretend to email User")
    }
    
    func phoneUser() {
        print("Pretend to call user")
    }
    
    func openWebsite() {
        print("Pretend to open URL")
    }
}
