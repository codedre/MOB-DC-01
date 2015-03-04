//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var opt1: AnyObject? = defaults.objectForKey("test_string")
        var opt2: AnyObject? = defaults.objectForKey("test_number")
        if opt1 == nil && opt2 == nil{
            println("its nil")
        } else{
            let testString = defaults.objectForKey("test_string") as String
            let testNumber = defaults.objectForKey("test_number") as Int
            
            self.textView.text = testString + " The number from defaults is \(testNumber)"
        }
    }
}