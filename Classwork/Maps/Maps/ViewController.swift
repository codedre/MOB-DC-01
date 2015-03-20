//
//  ViewController.swift
//  Maps
//
//  Created by Tedi Konda on 3/18/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AddressBookUI

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    let locman = CLLocationManager()
    let searchRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.map.mapType = MKMapType.Standard
        
        let initialLocation = CLLocation(latitude: 38.9059246844043, longitude: -77.0405378379645)
        centerMapOnLocation(initialLocation)
        
        self.map.delegate = self
        
        self.locman.delegate = self
        self.locman.desiredAccuracy = kCLLocationAccuracyBest // for walking distance uses gps and wifi
        self.locman.activityType = CLActivityType.Fitness
        self.locman.startUpdatingLocation()
        
    }
    
    func determineLocStatus() -> Bool {
        let isOk = CLLocationManager.locationServicesEnabled()
        if !isOk {
            return true
        }
        
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case CLAuthorizationStatus.AuthorizedAlways, CLAuthorizationStatus.AuthorizedWhenInUse:
            return true
        case .NotDetermined:
            self.locman.requestWhenInUseAuthorization()
            return true
        case .Restricted:
            return false
        case .Denied:
            return false
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("Updated location!")
        let loc = locations.last as CLLocation
        let coordinates = loc.coordinate
        
        println("You are currently at \(coordinates.latitude), \(coordinates.longitude)")
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, self.searchRadius * 2.0, self.searchRadius * 2.0)
        self.map.setRegion(coordinateRegion, animated: true)
    }

    
    @IBAction func showCurrentLoction(sender: UIButton) {
        self.locman.requestWhenInUseAuthorization()
        
        self.map.userTrackingMode = MKUserTrackingMode.Follow // walking 
    }
    
    
    @IBAction func geocodeAddress(sender: UIButton) {
        let loc = self.map.userLocation.location
        if loc == nil {
            println("I don't know where you are, yo!")
            return
        }
        
        let geocode = CLGeocoder()
        geocode.reverseGeocodeLocation(loc, completionHandler: { (placemarks: [AnyObject]!, error: NSError!) -> Void in
            if placemarks != nil {
                let placemark = placemarks[0] as CLPlacemark
                let address = ABCreateStringWithAddressDictionary(placemark.addressDictionary, false)
                
                println(" you are at:\n\(address)")
            }
        })
    }
    
    
    @IBAction func findFood(sender: UIButton) {
        if !determineLocStatus() { // always use
            println("Sorry can't give you food because you disabled location")
            return
        }
        
        let userLoc = self.map.userLocation
        let loc = userLoc.location
        
        if loc == nil {
            println("I don't know where you are!")
            return
        }
        
        let searchReq = MKLocalSearchRequest()
        searchReq.naturalLanguageQuery = "pizza"
        searchReq.region = self.map.region
        
        let search = MKLocalSearch(request: searchReq)
        search.startWithCompletionHandler { (response, error) -> Void in
            if response == nil {
                println(error)
                return
            }
            
            self.map.showsUserLocation = false
            // Felling lucky!
            let marker = response.mapItems[0] as MKMapItem
            let place = marker.placemark
            let loc = place.location.coordinate
            let region = MKCoordinateRegionMakeWithDistance(loc, 1200, 1200) // radius 
            self.map.setRegion(region, animated: true)
            let markerPin = MKPointAnnotation()
            markerPin.title = marker.name
            markerPin.subtitle = marker.phoneNumber
            markerPin.coordinate = loc
            
//            let resturant = Restaurant(title: marker.name, locationName: marker.name, coordinate: loc)
            self.map.addAnnotation(markerPin)
            
        }

    }
    
    
    @IBAction func getDirectionsToFood(sender: UIButton) {

    }
    
    
    @IBAction func showLocationInMapsApp(sender: UIButton) {
        let mapItem = MKMapItem.mapItemForCurrentLocation()
        
        mapItem.openInMapsWithLaunchOptions([MKLaunchOptionsMapTypeKey: MKMapType.Standard.rawValue])

    }
    



}

