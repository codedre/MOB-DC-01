//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            let path = NSTemporaryDirectory() + "ThirdVCText.txt"
            
            let fileText = self.textView.text
            
            fileText.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
            
            var destinationViewController = segue.destinationViewController as FourthViewController

    }
}