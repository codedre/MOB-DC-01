//
//  ViewController.swift
//  arraysAtWork
//
//  Created by Andre Shonubi on 1/28/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

protocol NewtodoItem {
    func addNewItem (newItem: String)
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: NewtodoItem?
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var toDoInputField: UITextField!
    @IBOutlet weak var hiddenLabel: UILabel!
    
    
    
    @IBAction func appendToArray(sender: AnyObject) {
        
        self.delegate?.addNewItem(self.toDoInputField.text)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.hidden = true
        self.toDoInputField.delegate = self
        self.hiddenLabel.hidden = true
        
        //Listening for function by the same name
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "unhideCurrentLabels:",
            name: "unhidehiddenLabels",
            object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textHasChanged:", name: UITextFieldTextDidChangeNotification, object: nil)
        
        
    }

    @IBAction func pressPostButton(sender: AnyObject) {
        //Fist step in setting notification
        NSNotificationCenter.defaultCenter().postNotificationName("unhidehiddenLabels", object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textHasChanged(notification: NSNotification){
        println("Horay the text has changed")
    }
    
    func unhideCurrentLabels(notification: NSNotification){
        self.hiddenLabel.hidden = false
        println("Triggered unhidehiddenLabels notification")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        toDoInputField.resignFirstResponder()
        
        if self.toDoInputField.text.isEmpty {
            println("Your tedt field is empty, enter something!")
            self.errorLabel.hidden = false
        } else {
            self.errorLabel.hidden = true
        }
        return true
        
    }


}

