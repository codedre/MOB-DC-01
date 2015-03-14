//
//  ViewController.swift
//  Whisperer
//
//  Created by Andre Shonubi on 3/11/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var whisper: UITextView!
    @IBOutlet weak var whisperCat: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveWhisper(sender: AnyObject) {
        var whisperP = PFObject(className: "Whisper")
        whisperP["whisper"] = self.whisper.text
        whisperP["user"] = "andre"
        whisperP["category"] = self.whisperCat.text
        whisperP.saveInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            if (success) {
                println(whisperP.objectId)
                println("Whisper saved successsfully!")
                self.whisper.text = ""
                self.whisperCat.text = ""
            } else {
                println(error.description)
            }
        }
    }

    @IBAction func readWhispers(sender: AnyObject) {
        var whisperQuery = PFQuery(className: "Whisper")
        whisperQuery.whereKey("category", equalTo: self.whisperCat.text)
        whisperQuery.findObjectsInBackgroundWithBlock { (whisperObjects: [AnyObject]!, error: NSError!) -> Void in
            for whisper in whisperObjects {
                if let whisperTitle: AnyObject? = whisper["whisper"] as? String {
                    println(whisperTitle)
                }
            }
        }
    }
}

