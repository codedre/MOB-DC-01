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
import Haneke

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let accessKey = "&key=AIzaSyDCWStgsI4e7f1sUC6zVWF_KU2DRVpAkWs"
    var query = "pizza+in+washington,dc"
    
    var jsonObj: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        googleplaces()
        
        
    }
    
    func googleplaces() {
        Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(query)\(accessKey)").responseJSON { (request, response, json, error) in
            if (json != nil) {
                self.jsonObj = JSON(json!)
                if let jsonDict = self.jsonObj {
                    if let imageString = jsonDict["results"][0]["photos"][0]["photo_reference"].string {
                        let url = NSURL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(imageString)\(self.accessKey)")
                        self.imageView.hnk_setImageFromURL(url!)
                    }
                }
            }
        }
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
