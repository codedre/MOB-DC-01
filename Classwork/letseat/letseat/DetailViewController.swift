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
        }
    }
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var bottomSquareWrapper: UIView!

    var galleryImage = UIImage()
    var slideOut: UIView?
    var slideOutTrailingConstraint:NSLayoutConstraint?
    var isInBackground: Bool = false
    
    var location:baseLocation?
    let accessKey = "&key=AIzaSyDCWStgsI4e7f1sUC6zVWF_KU2DRVpAkWs"
    var placeId: String?
    var results:[String: JSON] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleplaces()

        //createSlideOut()
        
    }
    
    func getBusinessDetails(){
        if let rating = self.results["rating"]?.float {
            setRatingImage(rating)
        }
        
        if let images = self.results["photos"]?.arrayValue {
            for (var i = 0; i < images.count; ++i)  {
                var image = images[i]["photo_reference"].string
                self.location?.details?.pictures[i] = image!
            }
        }
        
        if let hours = self.results["opening_hours"]?.dictionary {
            if let weekHours = hours["weekday_text"]?.arrayValue {
                for day in weekHours {
                    self.location?.details?.hours[7] = day.string!
                }
                
            }
        }
        
        
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
        println(self.placeId)
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
    
    func update() {
        
    }
    
    func createSlideOut() {
        self.slideOut = UIView(frame: CGRectZero)
        self.slideOut?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.slideOut?.backgroundColor = UIColor(red: 0.18, green: 0.212, blue: 0.239, alpha: 1)
        self.slideOut?.layer.shadowColor = UIColor.blackColor().CGColor
        self.slideOut?.layer.shadowOffset = CGSizeMake(0, -4)
        self.slideOut?.layer.shadowRadius = 4
        self.slideOut?.layer.shadowOpacity = 0.25
        self.view.addSubview(self.slideOut!)
        
//        let bg = UIImage(named: "bgwave")
//        let bgIV = UIImageView(image: bg)
//        bgIV.frame = CGRectMake(0, 220 - (bg!.size.height / 2), (bg!.size.width / 2), (bg!.size.height) / 2)
//        self.slideOut?.addSubview(bgIV)
        
//        let currentConditions = UIImage(named: "conditions")
//        let currentConditionsIV = UIImageView(image: currentConditions)
//        currentConditionsIV.setTranslatesAutoresizingMaskIntoConstraints(false)
//        self.slideOut?.addSubview(currentConditionsIV)
//        
//        currentConditionsIV.snp_makeConstraints { (make) -> () in
//            make.width.equalTo(currentConditions!.size.width / 2)
//            make.height.equalTo(currentConditions!.size.height / 2)
//            make.centerX.equalTo(self.slideOut!.snp_centerX)
//            make.centerY.equalTo(self.slideOut!.snp_centerY).with.offset(-15)
//        }
        
        self.slideOut?.snp_makeConstraints({ (make) -> () in
            make.height.equalTo(self.bottomSquareWrapper.snp_height)
            make.width.equalTo(self.bottomSquareWrapper.snp_width)
            make.left.equalTo(0)
            
        })
        
        self.slideOutTrailingConstraint = NSLayoutConstraint(item: self.slideOut!, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1.0, constant: 270)
        self.view.addConstraint(self.slideOutTrailingConstraint!)
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
        if self.isInBackground {
            self.bringBack()
        } else {
            self.bringToBackground()
        }
        println("I was tapped")
        self.isInBackground = !self.isInBackground
    }
    
    @IBAction func lunchWebSiteButton(sender: UIButton) {
        if let url = self.results["website"]?.URL {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func openMapsButton(sender: UIButton) {
        let mapItem = MKMapItem.mapItemForCurrentLocation()
        
        mapItem.openInMapsWithLaunchOptions([MKLaunchOptionsMapTypeKey: MKMapType.Standard.rawValue])

    }
    
    @IBAction func callButton(sender: UIButton) {
        if let phoneNumber = self.results["formatted_phone_number"]?.string {
            var convert:NSString = "\(phoneNumber)"
            convert = convert.stringByReplacingOccurrencesOfString("-", withString: "")
            convert = convert.stringByReplacingOccurrencesOfString("(", withString: "")
            convert = convert.stringByReplacingOccurrencesOfString(")", withString: "")
            let formatted = convert.stringByReplacingOccurrencesOfString(" ", withString: "")
            

            UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(formatted)")!)
            println(formatted)
        }
    }
    
    
    func bringBack() {
//        //animation, self.scrollview goes back to scale of 1.0
//        let scale = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
//        scale.springBounciness = 15.0
//        scale.springSpeed = 5.0
//        scale.toValue = NSValue(CGPoint: CGPointMake(1, 1))
//        self.scrollView.pop_addAnimation(scale, forKey: "scroolview.scale")
//        
//        self.scrollView.userInteractionEnabled = true
//        
//        let overlayOpacity = POPSpringAnimation(propertyNamed: kPOPViewAlpha)
//        overlayOpacity.springBounciness = 15.0
//        overlayOpacity.springSpeed = 5.0
//        overlayOpacity.toValue = 0.0
//        self.overlay?.pop_addAnimation(overlayOpacity, forKey: "overlay.opacity")
        
        // self.slideoutbottomconstraint beacomes = 30
        let slideoutMove = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        slideoutMove.springBounciness = 5.0
        slideoutMove.springSpeed = 15.0
        slideoutMove.toValue = 270
        self.slideOutTrailingConstraint?.pop_addAnimation(slideoutMove, forKey: "slideout.translate")
    }
    
    func bringToBackground() {
//        // animation, self.scrollview goes to a scale of 0.8
//        let scale = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
//        scale.springBounciness = 15.0
//        scale.springSpeed = 5.0
//        scale.toValue = NSValue(CGPoint: CGPointMake(0.8, 0.8))
//        self.scrollView.pop_addAnimation(scale, forKey: "scroolview.scale")
//        
//        self.scrollView.userInteractionEnabled = false
//        
//        let overlayOpacity = POPSpringAnimation(propertyNamed: kPOPViewAlpha)
//        overlayOpacity.springBounciness = 15.0
//        overlayOpacity.springSpeed = 5.0
//        overlayOpacity.toValue = 0.25
//        self.overlay?.pop_addAnimation(overlayOpacity, forKey: "overlay.opacity")
        
        // self.slideoutbottomconstraint beacomes = 30
        let slideoutMove = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        slideoutMove.springBounciness = 5.0
        slideoutMove.springSpeed = 15.0
        slideoutMove.toValue = 30
        self.slideOutTrailingConstraint?.pop_addAnimation(slideoutMove, forKey: "slideout.translate")
        
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
