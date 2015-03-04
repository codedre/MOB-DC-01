//
//  ViewController.swift
//  Persistaence Group
//
//  Created by Andre Shonubi on 2/23/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let atheleteNmaes = defaults.objectForKey("athlete") as NSArray as Array
        
        
        println("\(atheleteNmaes)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

