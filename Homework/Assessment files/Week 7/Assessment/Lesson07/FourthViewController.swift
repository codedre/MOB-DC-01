//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = NSTemporaryDirectory() + "ThirdVCText.txt"
        
        let readFromFile : NSString? = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
        
        if let readIn = readFromFile {
            self.textView.text = readIn
        }
    }
}
