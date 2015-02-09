//
//  ViewController.swift
//  classAssignment
//
//  Created by Andre Shonubi on 2/4/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var userNameTextBox = UITextField(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50))
        userNameTextBox.textColor = UIColor.blackColor()
        userNameTextBox.layer.borderColor = UIColor.grayColor().CGColor
        userNameTextBox.layer.borderWidth = 1.0
        userNameTextBox.placeholder = "Username"
        userNameTextBox.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin
        self.view.addSubview(userNameTextBox)
        
        var passWordText = UITextField(frame: CGRect(x: 0, y: 120, width: self.view.frame.width, height: 50))
        passWordText.textColor = UIColor.blackColor()
        passWordText.layer.borderColor = UIColor.grayColor().CGColor
        passWordText.layer.borderWidth = 1.0
        passWordText.secureTextEntry = true
        passWordText.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin
        self.view.addSubview(passWordText)
        
        var loginBtn = UIButton(frame: CGRect(x: self.view.frame.width/2, y: 190, width: 50, height: 50))
        loginBtn.backgroundColor = UIColor.redColor()
        loginBtn.setTitle("Login", forState: .Normal)
        self.view.addSubview(loginBtn)
        
        

        
    }

    

}

