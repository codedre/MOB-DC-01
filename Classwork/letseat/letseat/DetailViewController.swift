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

class DetailViewController: UIViewController {

    
    @IBOutlet weak var bottomSquareWrapper: UIView!
    @IBOutlet weak var imageView: UIImageView!
    var slideOut: UIView?
    var slideOutTrailingConstraint:NSLayoutConstraint?
    var isInBackground: Bool = false
    
    let accessKey = "&key=AIzaSyDCWStgsI4e7f1sUC6zVWF_KU2DRVpAkWs"
    var query = "pizza+in+washington,dc"
    var placeId: String?
    var jsonObj: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleplaces()
        
        
        //createSlideOut()
        
    }
    
    func getBusinessDetails(){
        
    }
    
    func googleplaces() {
        Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(self.placeId)\(self.accessKey)").responseJSON { (request, response, json, error) in
            if (json != nil) {
                self.jsonObj = JSON(json!)
                if let jsonDict = self.jsonObj {
                    if let status = jsonDict["status"].string {
                        if status == "OK" {
                            self.getBusinessDetails()
                        } else{
                            println(status)
                            return
                        }
                    }
                }
            }
        }
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
    
    @IBAction func ratingSlideOutToggle(sender: AnyObject) {
        if self.isInBackground {
            self.bringBack()
        } else {
            self.bringToBackground()
        }
        
        self.isInBackground = !self.isInBackground
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
