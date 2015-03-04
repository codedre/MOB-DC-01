
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = NSTemporaryDirectory() + "FifthVC.txt"
        
        let readArray: NSArray? = NSArray(contentsOfFile: path)
        
        
        if let array = readArray{
            self.textView.text = "\(array)"
            println(array)
        }
    }
}
