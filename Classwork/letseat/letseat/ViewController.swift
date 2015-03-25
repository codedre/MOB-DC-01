//
//  ViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/9/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoImageView: UIImageView!


    @IBOutlet weak var moodTop: NSLayoutConstraint!
    @IBAction func foodButton(sender: AnyObject) {
        
    }
    
    @IBAction func moodButton(sender: AnyObject) {
    }
    
    @IBOutlet weak var mood: UIButton!
    @IBOutlet weak var food: UIButton!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        self.logoTopConstraint.constant = 0
        self.moodTop.constant = 57
        self.mood.hidden = false
        self.food.hidden = false
        self.mood.layer.cornerRadius = 10.0
        self.mood.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        
        self.food.layer.cornerRadius = 10.0
        self.food.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        
        self.navigationController?.navigationBarHidden = true

        
        
        
        UIView.animateWithDuration(27677008.5, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

