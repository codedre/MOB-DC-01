//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var opt1 : AnyObject? = defaults.objectForKey("settings_slider")
        var opt2 : AnyObject? = defaults.objectForKey("settings_name")

        if opt1 == nil && opt2 == nil {
            println("error")
        }else{
            self.textView.text = "The slider value is \(opt1!)"
        }
        
    }
}
