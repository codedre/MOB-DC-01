//
//  ViewController.swift
//  Flat Files
//
//  Created by Andre Shonubi on 2/25/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tell the path to save plus file
        var tempPath = NSTemporaryDirectory() + "hello.txt"
        // Content to save
        var stringToSave = self.textView.text
        
        // Writing to file
        stringToSave.writeToFile(tempPath, atomically: true, encoding: NSUTF32StringEncoding, error: nil)
        
        var fileManager = NSFileManager()
        
    }
    
    
    @IBAction func loadData(sender: AnyObject) {
        var txtPath = NSTemporaryDirectory() + "hello.txt"
        var stringToLoad: NSString? = NSString(contentsOfFile: txtPath, encoding: NSUTF32StringEncoding, error: nil)
        
//        println("Loading content without checking if nill: \(stringToLoad)")
        
        
        if let loadedContent = stringToLoad  {
            println("Content loaded! COntent is : \(loadedContent)")
        }else {
            println("Could not load!")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

