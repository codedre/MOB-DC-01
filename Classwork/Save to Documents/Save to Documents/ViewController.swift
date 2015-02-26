//
//  ViewController.swift
//  Save to Documents
//
//  Created by Andre Shonubi on 2/25/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func saveContent(sender: AnyObject) {
        let fileManager = NSFileManager() // gives us access to the documents and cashe directory
        let urls = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
        
        
        
        if urls.count > 0 {
            let documentsFolder = urls[0].relativePath! as String
            let mySavedPath = documentsFolder + "/savedText.txt"
            
            var contentToSave = self.textView.text
            
            contentToSave.writeToFile(mySavedPath, atomically: true, encoding: NSUTF32StringEncoding, error: nil)
            
        }else {
            println("Could not save")
        }
        
        
    }
    
    @IBAction func loadContent(sender: AnyObject) {
        let fileManager = NSFileManager() // find the documents path
        let urls = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
        
        
        // if documents path exists, tun the following cod
        if urls.count > 0 {
            // Concatinate our file name after our documents path
            let documentsFolder = urls[0].relativePath! as String
            let mySavedPath = documentsFolder + "/savedText.txt"
            
            // Access our file from the path we defined above
            var stringToLoad: NSString? = NSString(contentsOfFile: mySavedPath, encoding: NSUTF32StringEncoding, error: nil)
        
            // If the file exists, run the blck below
            if let loadedContent = stringToLoad  {
                println("Content loaded! COntent is : \(loadedContent)")
            }else {
                println("Could not load!")
            }
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

