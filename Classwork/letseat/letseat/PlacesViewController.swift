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

class PlacesViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    let accessKey = "&key=AIzaSyDCWStgsI4e7f1sUC6zVWF_KU2DRVpAkWs"
    var query = "pizza+in+washington,dc"
    var menuButtom: HamburgerButton! = nil
//    var places: [String]? = []
    var jsonObj: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //drawMap()
        mapView.showsUserLocation = true
        navigation()
        googleplaces()
        self.resultsTableView.registerNib(UINib(nibName: "BusinessCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    
    
    func googleplaces() {
        Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(query)\(accessKey)").responseJSON { (request, response, json, error) in
            if (json != nil) {
                self.jsonObj = JSON(json!)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.resultsTableView.reloadData()
                })
            } else {
                println(error)
            }
        }
    }
    
    // draw map to view
    func drawMap() {
        
        var latDelta: CLLocationDegrees = 0.007
        var longDelta: CLLocationDegrees = 0.007
        
        var theRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpanMake(latDelta, longDelta))
        
        self.mapView.setRegion(theRegion, animated: true)
        
//        var placeAnnotation = MKPointAnnotation()
//        placeAnnotation.coordinate = churchLocation
//        placeAnnotation.title = "GA"
//        placeAnnotation.subtitle = "is right here"
//        
//        self.mapView.addAnnotation(placeAnnotation)
    }
    
    // add custom naviagiton items
    func navigation() {
        self.menuButtom = HamburgerButton(frame: CGRectMake(0, 0, 5, 5))
        self.menuButtom.addTarget(self, action: "toggle:", forControlEvents: .TouchUpInside)
        var transform = self.menuButtom.transform
        transform = CGAffineTransformScale(transform, 0.65, 0.65)
        
        self.menuButtom.transform = transform
        self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: self.menuButtom), animated: true)
        
        self.navigationItem.title = "Happy"
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
    
    
    // TableView Settings
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let jsonData = self.jsonObj {
            let count = jsonData["results"].count
            return count
        }
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:BusinessCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as BusinessCell
//        cell.reset()
        // Sets each cell to equal each item in the array
        if let jsonDict = self.jsonObj {
            // get images for each business
            if let imageString = jsonDict["results"][indexPath.row]["photos"][0]["photo_reference"].string  {
                
                let url = NSURL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=70&photoreference=\(imageString)\(self.accessKey)")
                cell.thumbImageView?.hnk_setImageFromURL(url!)
            }
            // set label to each business name
            cell.nameLabel?.text = jsonDict["results"][indexPath.row]["name"].string
            
            // get price level
            if let priceLevel = jsonDict["results"][indexPath.row]["price_level"].int {
                let money: Character = "$"
                cell.priceLabel.text = String(count: priceLevel, repeatedValue: money)
            }
            
            // rating image
            if let ratingLevel = jsonDict["results"][indexPath.row]["rating"].float {
                cell.setRatingImage(ratingLevel)
            }
            
            // rating Label
            if let status = jsonDict["results"][indexPath.row]["opening_hours"]["open_now"].bool {
                cell.setStatus(status)
            }
            
            // address
            if let address = jsonDict["results"][indexPath.row]["formatted_address"].string {
                cell.setAdd(address)
            }
            
            // categories
            if let categories = jsonDict["results"][indexPath.row]["types"].array {
                var complete = ""
                var all: [String] = []
                for cat in categories {
                    let category = cat.string
                    all.append(category!)
                    complete = ", ".join(all)
                    //cell.setCategories(category!)
                }
//                let category = categories[].string
                println(complete)
                cell.setCategories(complete)
                
            }
            

        } else{
            println("something went wrong")
        }
        
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
