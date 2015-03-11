//
//  ViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/9/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    func loadYelp () {
        Alamofire.request(.GET, "http://google.com", parameters: nil)
            .response { (request, response, data, error) in
                println(request)
                println(response)
                println(error)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //calling api's
        self.loadYelp()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//http://api.yelp.com/v2/search?term=food&location=San+Francisco&oauth_consumer_key=zrwuNdHcFxXgwzJ1FNskDw&oauth_token=ye_nBE1-uvZDdfxmJsU_r1OyA6pCqbro&oauth_signature_method=HMAC-SHA1&oauth_signature=HsN4mnl9y0eZLDdq976ZJlgXLQ8&oauth_timestamp=1426054495&oauth_nonce=kllo9940pd9333jh
//
//
//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=cruise&key=AIzaSyDCWStgsI4e7f1sUC6zVWF_KU2DRVpAkWs
