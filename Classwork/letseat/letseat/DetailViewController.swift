//
//  DetailViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/14/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import pop
import MapKit
import Haneke

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var galleryTableView: UITableView! {
        didSet {
            self.galleryTableView.separatorStyle = UITableViewCellSeparatorStyle.None
            self.galleryTableView.showsVerticalScrollIndicator = false
            // Background color
    
            self.galleryTableView.backgroundColor = UIColor.clearColor()
        }
    }
    
    
    //////// PLEASE FORGIVE ME I RAN OUT OF TIME/////////
    @IBOutlet weak var hourView: UIView!
    @IBOutlet weak var leadingDayConstraint: NSLayoutConstraint!
    @IBOutlet weak var sunHours: UILabel!
    
    @IBOutlet weak var modayView: MyCustomButton!
    @IBOutlet weak var monLeading: NSLayoutConstraint!
    @IBOutlet weak var monHours: UILabel!
    

    
    /////////////////////////////////////////////////////
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!

    var galleryImage = UIImage()
    var hourIsVisible = false
    
    var location:baseLocation?
    let accessKey = "&key=AIzaSyDCWStgsI4e7f1sUC6zVWF_KU2DRVpAkWs"
    var placeId: String?
    var results:[String: JSON] = [:]
    var weekday:[String] = []
    var viewWidth:CGFloat = 0.0
    var WeekdayVC:WeekDayViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleplaces()
        
       self.WeekdayVC = WeekDayViewController()
       // self.view.addSubview(self.WeekdayVC!.view)
        
        // Get inferred width
        self.viewWidth = self.view.frame.size.width - 165
        
        // Background color
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.orangeColor().CGColor, UIColor.redColor().CGColor]
        gradient.startPoint = CGPointMake(0, 0)
        gradient.endPoint = CGPointMake(0, 1)
        gradient.locations = [0.4,0.99]
        gradient.frame = self.view.frame
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "hourViewTapped:")
        self.hourView.addGestureRecognizer(tapGesture)
//
//        self.monday.view? = self.modayView
//        self.monday.label? = self.monHours
//        self.monday.constraint? = self.monLeading
//        
//        let monTap = UITapGestureRecognizer(target: self, action: "findbutton:")
//        self.monday.view?.addGestureRecognizer(monTap)
        
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////// SUPER UGLY CODE BLOCK  /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
//    func findButton(sender: UITapGestureRecognizer) {
//        if sender.view == self.monday.view {
//            hourViewTapped(self.monday.view!, label: self.monday.label!, constraint: self.monday.constraint!)
//        }
//    }
//    
    func hourViewTapped(sender:UITapGestureRecognizer) {
        if self.hourIsVisible {
            self.slideToDay()
        } else {
            self.slideToHour()
        }
        
        self.hourIsVisible = !self.hourIsVisible
    }
    
    func slideToDay() {
        self.leadingDayConstraint.constant = 0
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.hourView.layoutIfNeeded()
            }, completion: nil)
    }
    
    func slideToHour() {
        self.leadingDayConstraint.constant = -(self.viewWidth)
        self.sunHours.text = self.weekday.last
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.hourView.layoutIfNeeded()
            }, completion: nil)
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    func getBusinessDetails(){
        if let rating = self.results["rating"]?.float {
            setRatingImage(rating)
        }
        
        if let hours = self.results["opening_hours"]?.dictionary {
            if let weekHours = hours["weekday_text"]?.arrayValue {
                for day in weekHours {
                    var unformatted = day.string!
                    var result = unformatted._search(" ")
                    var formatted = unformatted._substringFromIndex(result!+1)
                    self.weekday.append(formatted!)
                }
                
            }
        }
        
        
        
        
        
        /////////////////////////////////////////////////////////////////////
        
        
        if let reviews = self.results["reviews"]?.arrayValue {
            if reviews.isEmpty {} else {
                for (var i = 0; i < 5; ++i) {
                  //  var test = reviews[i]["author_name"].string
//                    println(test)
//                    self.location?.reviews?.author[i] = reviews[i]["author_name"].string!
//                    self.location?.reviews?.rating[i] = reviews[i]["rating"].float!
//                    self.location?.reviews?.review[i] = reviews[i]["text"].string!
//                    self.location?.reviews?.time[i] = reviews[i]["time"].int!
                }
            }
        }
    }
    
    func googleplaces() {
        Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(self.placeId!)\(self.accessKey)").responseJSON { (request, response, json, error) in
            if (json != nil) {
                var jsonObj = JSON(json!)
                if let status = jsonObj["status"].string {
                    if status == "OK" {
                        if let results = jsonObj["result"].dictionary {
                            self.results = results
                            self.getBusinessDetails()
                            
                            dispatch_async(dispatch_get_main_queue(), {
                                self.galleryTableView.reloadData()
                            })
                        }
                    } else{
                        println(status + "this is a status")
                        return
                    }
                }
            }
            //println(request)
        }
    }
    
    // set the correct ratings image to display in the the ratingsImageView
    func setRatingImage(rating:Float) {
        
        switch rating {
        case 1.0...1.2:
            self.ratingImageView.image = UIImage(named: "1s")
        case 1.3...1.7:
            self.ratingImageView.image = UIImage(named: "1.5s")
        case 1.8...2.2:
            self.ratingImageView.image = UIImage(named: "2s")
        case 2.3...2.7:
            self.ratingImageView.image = UIImage(named: "2.5s")
        case 2.8...3.2:
            self.ratingImageView.image = UIImage(named: "3s")
        case 3.3...3.7:
            self.ratingImageView.image = UIImage(named: "3.5s")
        case 3.8...4.2:
            self.ratingImageView.image = UIImage(named: "4s")
        case 4.3...4.7:
            self.ratingImageView.image = UIImage(named: "4.5s")
        case 4.8...5:
            self.ratingImageView.image = UIImage(named: "5")
        default:
            self.ratingImageView.image = UIImage(named: "0s")
        }
        
        self.ratingLabel.text = "\(rating)"
    }
    
    @IBAction func ratingSlideOutToggleButton(sender: UIButton) {
//        if self.isInBackground {
//            self.bringBack()
//        } else {
//            self.bringToBackground()
//        }
//        println("I was tapped")
//        self.isInBackground = !self.isInBackground
    }
    
    @IBAction func lunchWebSiteButton(sender: UIButton) {
        if let url = self.results["website"]?.URL {
            performSegueWithIdentifier("web", sender: NSURLRequest(URL: url))
        }
    }
    
    @IBAction func openMapsButton(sender: UIButton) {
        var latitude: Double?
        var longitude: Double?
        
        if let geometry = self.results["geometry"]?.dictionary {
            if let location = geometry["location"]?.dictionary{
                if let lat = location["lat"]?.double {
                    latitude = lat
                }
                if let lng = location["lng"]?.double {
                    longitude = lng
                }
            }
        }
        
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        let mapMarker = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: mapMarker)
        mapItem.name = self.results["name"]?.string
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        let currentLocationMapItem = MKMapItem.mapItemForCurrentLocation()
        
        let openMaps = MKMapItem.openMapsWithItems([currentLocationMapItem, mapItem], launchOptions: launchOptions)
       // mapItem.openInMapsWithLaunchOptions([MKLaunchOptionsMapTypeKey: MKMapType.Standard.rawValue, MKLaunchOptionsDirectionsModeKey])

    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////// PHONE FUNCTION BLOCK  /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBAction func callButton(sender: UIButton) {
        if let phoneNumber = self.results["formatted_phone_number"]?.string {
            var convert:NSString = "\(phoneNumber)"
            convert = convert.stringByReplacingOccurrencesOfString("-", withString: "")
            convert = convert.stringByReplacingOccurrencesOfString("(", withString: "")
            convert = convert.stringByReplacingOccurrencesOfString(")", withString: "")
            let formatted = convert.stringByReplacingOccurrencesOfString(" ", withString: "")
            
            let alertBox = UIAlertController(title: phoneNumber, message: nil, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
            })
            let callAction = UIAlertAction(title: "Call", style: .Default, handler: { (action) -> Void in
                UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(formatted)")!)
                return
            })
            
            alertBox.addAction(cancelAction)
            alertBox.addAction(callAction)
            
            self.presentViewController(alertBox, animated: true, completion: nil)

        }
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
    
    
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let request = sender as? NSURLRequest {
            var destinationViewController = segue.destinationViewController as WebViewController
            destinationViewController.request = request
        }
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////// TABLE VIEW SECTION ////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // MARK: - Table view data source
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let photos = self.results["photos"]?.arrayValue {
            let count = photos.count
            return count
        }
        return 0
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:DetailTableViewCell = tableView.dequeueReusableCellWithIdentifier("picCell", forIndexPath: indexPath) as DetailTableViewCell //?? DetailTableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        cell.clipsToBounds = true
        
        if let images = self.results["photos"]?.arrayValue {
            if let imageString = images[indexPath.row]["photo_reference"].string {
                let url = NSURL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=149&photoreference=\(imageString)\(self.accessKey)")
                cell.galleryImgView?.hnk_setImageFromURL(url!)
            }
        }
        
        
        return cell
        
    }

}
