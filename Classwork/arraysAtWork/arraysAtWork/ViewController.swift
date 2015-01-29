//
//  ViewController.swift
//  arraysAtWork
//
//  Created by Andre Shonubi on 1/28/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toDoList = ["Get up", "Shower", "Brush Teeth", "Comb hair", "Put on pants"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoList.append("Put on shirt")
        
        for i in toDoList {
            println(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

