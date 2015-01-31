//
//  ViewController.swift
//  arraysAtWork
//
//  Created by Andre Shonubi on 1/28/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toDoInputField: UITextField!
    var toDoList = ["Get up", "Shower", "Brush Teeth", "Comb hair", "Put on pants"]
    
    
    @IBAction func appendToArray(sender: AnyObject) {
        toDoList.append(toDoInputField.text)
        for i in toDoList {
            println(i)
        }   
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoList.append("Put on shirt")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
