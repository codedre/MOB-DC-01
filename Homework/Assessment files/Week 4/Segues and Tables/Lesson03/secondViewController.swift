//
//  secondViewController.swift
//  Lesson03
//
//  Created by Andre Shonubi on 1/26/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    @IBAction func dismissThisModal(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var androidImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
