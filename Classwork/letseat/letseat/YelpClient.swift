//
//  YelpClient.swift
//  Yelp
//
//  Created by Timothy Lee on 9/19/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit
import OAuthSwift

class YelpClient {
    
    func doOAuthYelp() {
        let oauthswift = OAuth1Swift(
            consumerKey:    Yelp["consumerKey"]!,
            consumerSecret: Yelp["consumerSecret"]!,
            requestTokenUrl: "http://api.yelp.com/v2/",
            authorizeUrl:    "http://api.yelp.com/v2/",
            accessTokenUrl:  "http://api.yelp.com/v2/"
        )
        
        let date = NSDate()
        let timestamp = date.timeIntervalSince1970
        
        
        oauthswift.authorizeWithCallbackURL( NSURL(string: "oauth-swift://oauth-callback/yelp")!, success: {
            credential, response in
            println("Yelp", message: "oauth_token:\(credential.oauth_token)\n\noauth_toke_secret:\(credential.oauth_token_secret)")
            let url :String = "http://api.yelp.com/v2/"
            let parameters :Dictionary = [
                "oauth_consumer_key"      : "zrwuNdHcFxXgwzJ1FNskDw",
                "oauth_token"             : "ye_nBE1-uvZDdfxmJsU_r1OyA6pCqbro",
                "oauth_signature_method"  : "hmac-sha1",
                "oauth_signature"         : "json",
                "oauth_timestamp"         : "dfgdjfd",
                "oauth_nonce"             : "url_q,url_z"
            ]
            oauthswift.client.get(url, parameters: parameters,
                success: {
                    data, response in
                    let jsonDict: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil)
                    println(jsonDict)
                }, failure: {(error:NSError!) -> Void in
                    println(error)
            })
            
            
            }, failure: {(error:NSError!) -> Void in
                println(error.localizedDescription)
        })
        
    }
    
    func showAlertView(title: String, message: String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        //self.presentViewController(alert, animated: true, completion: nil)
    }
            
}


