//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let path = NSTemporaryDirectory() + "FifthVC.txt"
        
        
        let myText: NSString = self.textView.text
        
        let myArray: NSArray = [myText .componentsSeparatedByString(" ")]
        
        myArray.writeToFile(path, atomically: true)
        
        
        var destinationViewController = segue.destinationViewController as SixthViewController
    }
}
