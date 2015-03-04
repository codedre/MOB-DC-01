//
//  ViewController.swift
//  Networking example
//
//  Created by Andre Shonubi on 3/2/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let url = NSURL(string: "http://google.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            // Pass our NS Data return to a string
            var stringData = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            // UI updates need to happen on the main thread. By default NSURLSession connections happen as a side thread, so we have to access our main thread to update our views.
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.textView.text = stringData
                
                if error != nil {
                    self.textView.text = "No Connection Error"
                } else {
                    self.textView.text = stringData

                }
                
            })
        })
                
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

