//
//  ViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/9/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    
    func setBackground(){
        
        // Background color
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.orangeColor().CGColor, UIColor.redColor().CGColor]
        gradient.startPoint = CGPointMake(0, 0)
        gradient.endPoint = CGPointMake(0, 1)
        gradient.locations = [0.4,0.99]
        gradient.frame = self.view.frame
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        
        // Parallax ////////////////////////////////
        
        // Set vertical effect
        var verticalMotionEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -10
        verticalMotionEffect.maximumRelativeValue = 10
        
        // Set horizontal effect
        
        var horizontalMotionEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -10
        horizontalMotionEffect.maximumRelativeValue = 10
        
        // Combination
        
        var combinationEffect: UIMotionEffectGroup = UIMotionEffectGroup()
        combinationEffect.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        self.view.addMotionEffect(combinationEffect)
    }
    
    // Login in textfield
    func drawTextField() {
//        self.loginTextField.borderStyle = UITextBorderStyle.None
        self.loginTextField.placeholder = "Some Text Here"
        self.loginTextField.textColor = UIColor.blackColor()
        
        var bottomBorder = CALayer()
        bottomBorder.frame = CGRectMake(0.0, self.loginTextField.frame.size.height - 1, self.loginTextField.frame.size.width, 1.0);
        bottomBorder.backgroundColor = UIColor.blackColor().CGColor
        self.loginTextField.layer.addSublayer(bottomBorder)

    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setBackground()
        drawTextField()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

