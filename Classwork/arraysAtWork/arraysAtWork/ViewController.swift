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

class ViewController: UIViewController {
    
    var delegate: NewtodoItem?
    
    @IBOutlet weak var toDoInputField: UITextField!
    
    
    
    @IBAction func appendToArray(sender: AnyObject) {
        
        self.delegate?.addNewItem(self.toDoInputField.text)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

