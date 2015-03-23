//
//  PlacesViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/13/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON
import Haneke
import CoreLocation
import Foundation


class PlacesViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    let accessKey = "&key=AIzaSyDCWStgsI4e7f1sUC6zVWF_KU2DRVpAkWs" //GooglePlaces[accessKey]

    let locman = CLLocationManager()
    let searchRadius: CLLocationDistance = 1000
    let currentLocation: CLLocation?
    
    
    var navTitle:String?
    var query:String? 
    var currentLoc = ""
    var distance: [AnyObject] = []
    
    
    var location:baseLocation?
    var menuButtom: HamburgerButton! = nil
    var results:[JSON]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawMap()
        googleplaces()
        navigation()
        self.resultsTableView.registerNib(UINib(nibName: "BusinessCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    
    // call api
    func googleplaces() {
        Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/place/textsearch/json?location=\(self.currentLoc)&radius=\(self.searchRadius)&types=food&query=\(self.query!)\(self.accessKey)").responseJSON { (request, response, json, error) in
            if (json != nil) {
                var jsonObj = JSON(json!)
                if let results = jsonObj["results"].arrayValue as [JSON]? {
                    self.results = results
                    

                   dispatch_async(dispatch_get_main_queue(), {
                    self.resultsTableView.reloadData()
                    self.drawMap()
                   })
                }
            }
            println(error)
            println(response)
            println(request)
        }
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////// MAP SECTION ///////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // draw map to view
    func drawMap() {
        self.mapView.mapType = MKMapType.Standard
        determineLocStatus()

        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        
        self.locman.delegate = self
        self.locman.desiredAccuracy = kCLLocationAccuracyBest
        self.locman.activityType = CLActivityType.Fitness
        self.locman.startUpdatingLocation()
        
        let coordinates = self.locman.location
        self.currentLoc = "\(coordinates.coordinate.latitude),\(coordinates.coordinate.longitude)"
        centerMapOnLocation(coordinates)
        
    }
    
    func setMapMarkers(coordinates: CLLocationCoordinate2D) {
        var mapMarker = MKPointAnnotation()
        mapMarker.coordinate = coordinates
        self.mapView.addAnnotation(mapMarker)
        self.mapView.reloadInputViews()
    }
    
    @IBAction func showCurrentLocation(){
        determineLocStatus()
        self.mapView.userTrackingMode = MKUserTrackingMode.Follow
        self.mapView.showsUserLocation = true
        googleplaces()
        
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
        
        //println("Updated location!")
        let loc = locations.last as CLLocation
        let coordinates = loc.coordinate
    
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, self.searchRadius * 7, self.searchRadius * 7)
        self.mapView.setRegion(coordinateRegion, animated: true)
        
        //coodinates
        if self.results != nil {
            for (var index = 0; index < self.results?.count; ++index) {
                if let location = self.results?[index]["geometry"]["location"].dictionary {
                    var lat: CLLocationDegrees?
                    var lng: CLLocationDegrees?
                    
                    if let latitude = location["lat"]?.double{
                        lat = latitude
                    }
                    if let longitude = location["lng"]?.double{
                        lng = longitude
                    }
                    var coordinates: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat!, lng!)
                    setMapMarkers(coordinates)
                    
                    // Calculate distance to current location in miles
                    var currentCoordinates:CLLocation = CLLocation(latitude: lat!, longitude: lng!)
                    var foo: CLLocationDistance = currentCoordinates.distanceFromLocation(self.locman.location) / 1609.344
                    self.distance.append(foo)
                }
            }
        }
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////// GENERAL SECTION ////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    // add custom naviagiton items
    func navigation() {
        self.menuButtom = HamburgerButton(frame: CGRectMake(0, 0, 5, 5))
        self.menuButtom.addTarget(self, action: "toggle:", forControlEvents: .TouchUpInside)
        var transform = self.menuButtom.transform
        transform = CGAffineTransformScale(transform, 0.65, 0.65)
        
        self.menuButtom.transform = transform
//        self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: self.menuButtom), animated: true)
        self.navigationItem.title = navTitle?


        
        let titleColor: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleColor
        
    }
    
    // toogle for button animation
    func toggle(button:UIButton) {
        self.menuButtom.showsMenu = !self.menuButtom.showsMenu
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////// TABLE VIEW SECTION ////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    // TableView Settings
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.results != nil {
            let count = self.results?.count
            return count!
        }
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:BusinessCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as BusinessCell
        
        if let imageString = self.results?[indexPath.row]["photos"][0]["photo_reference"].string  {
            self.location?.details?.pictures.append(imageString)
            let url = NSURL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=70&photoreference=\(imageString)\(self.accessKey)")
            cell.thumbImageView.hnk_setImageFromURL(url!)
        }
        
        // set label to each business name
        if let name = self.results?[indexPath.row]["name"].string {
            cell.nameLabel.text = name
        }
        
        // get price level
        if let priceLevel = self.results?[indexPath.row]["price_level"].int {
            let money: Character = "$"
            cell.priceLabel.text = String(count: priceLevel, repeatedValue: money)
        }
        
        // rating image
        if let ratingLevel = self.results?[indexPath.row]["rating"].floatValue {
            cell.setRatingImage(ratingLevel)
        }
        
        // rating Label
        if let status = self.results?[indexPath.row]["opening_hours"]["open_now"].bool {
            cell.setStatus(status)
        }
        
        // address
        if let address = self.results?[indexPath.row]["formatted_address"].string {
            cell.addressLabel.text = address
        }
        
        // set distance label
        var dist = self.distance[indexPath.row] as Double
        var convert = dist.format(".2")
        cell.distanceLabel.text = "\(convert) miles"
        
        
        // categories
        if let categories = self.results?[indexPath.row]["types"].array {
            var complete = ""
            var all: [String] = []
            for cat in categories {
                let category = cat.string
                all.append(category!)
                complete = ", ".join(all)
            }
            self.location?.types = complete
            cell.categoryLabel.text = complete
            
        }
        return cell
        
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //var objects: [AnyObject] = []
        if let jsonDict = self.results {
            if let placeID = jsonDict[indexPath.row]["place_id"].string {
                self.performSegueWithIdentifier("showPlaceDetails", sender: placeID)
            }
        }
        
        // Fun test to pass more than one object
//        let indexPath = tableView.indexPathForSelectedRow()
//        let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as BusinessCell!
//        
//
//        objects.append(currentCell.ratingImageView)
        //println(objects)
        //self.performSegueWithIdentifier("showPlaceDetails", sender: objects)

    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as DetailViewController
        
        if let placeID = sender as? String {
            destinationViewController.placeId = placeID
        }
            
//            if let ratingImage = passObj[1] as? UIImageView {
//                destinationViewController.ratingImageView = ratingImage
//            }
//        }
     
    }

}

// to set double precision 
// credit: Anton Tcholakov on Stackoverflow : http://stackoverflow.com/questions/24051314/precision-string-format-specifier-in-swift
extension Int {
    func format(f: String) -> String {
        return NSString(format: "%\(f)d", self)
    }
}

extension Double {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self)
    }
}
