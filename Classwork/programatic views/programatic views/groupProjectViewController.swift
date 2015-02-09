//
//  groupProjectViewController.swift
//  programatic views
//
//  Created by Andre Shonubi on 2/4/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class groupProjectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       var userNameTextBox = UITextField(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 20))
        userNameTextBox.textColor = UIColor.blackColor()
        self.view.addSubview(userNameTextBox)
    }

}
