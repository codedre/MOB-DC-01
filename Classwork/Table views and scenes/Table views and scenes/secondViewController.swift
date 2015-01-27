//
//  secondViewController.swift
//  Table views and scenes
//
//  Created by Andre Shonubi on 1/26/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBAction func goBackToFirstVC(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        
        // goes all the way home
        //self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
