//
//  CreateMoodViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/19/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import Snap

class CreateMoodViewController: UIViewController {

    var wrapper: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawWrapper()
        drawSentence()
        
        // Background color
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.orangeColor().CGColor, UIColor.redColor().CGColor]
        gradient.startPoint = CGPointMake(0, 0)
        gradient.endPoint = CGPointMake(0, 1)
        gradient.locations = [0.4,0.99]
        gradient.frame = self.view.frame
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        

    }
    
    func drawWrapper() {
        self.wrapper = UIView(frame: CGRect(x: 10, y: 80, width: (self.view.frame.size.width)-20, height: 430))
        self.wrapper?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        self.wrapper?.layer.cornerRadius = 20
        //wrapper.delegate = self
        
        self.view.addSubview(self.wrapper!)
    }
    
    func drawSentence() {
        var firstLine = UILabel(frame: CGRect(x: 10, y: 20, width: (self.wrapper!.frame.size.width)-20, height: 28))
        firstLine.text = "I'M"
        firstLine.textColor = UIColor.blackColor()
        firstLine.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.wrapper!.addSubview(firstLine)
        
        var secondline = UILabel(frame: CGRect(x: 10, y: 80, width: (self.wrapper!.frame.size.width)-20, height: 28))
        secondline.text = "FEELING"
        secondline.textColor = UIColor.blackColor()
        secondline.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.wrapper!.addSubview(secondline)
        
        
        var thirdLine = UILabel(frame: CGRect(x: 10, y: 140, width: (self.wrapper!.frame.size.width)-20, height: 28))
        thirdLine.text = "HAPPY"
        thirdLine.textColor = UIColor.whiteColor()
        thirdLine.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        thirdLine.userInteractionEnabled = true
        self.wrapper!.addSubview(thirdLine)
        
        var fourthline = UILabel(frame: CGRect(x: 10, y: 200, width: (self.wrapper!.frame.size.width)-20, height: 28))
        fourthline.text = "AND IN THE"
        fourthline.textColor = UIColor.blackColor()
        fourthline.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.wrapper!.addSubview(fourthline)
        
        var fifthline = UILabel(frame: CGRect(x: 10, y: 260, width: (self.wrapper!.frame.size.width)-20, height: 28))
        fifthline.text = "MOOD FOR"
        fifthline.textColor = UIColor.blackColor()
        fifthline.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.wrapper!.addSubview(fifthline)
        
        var sixthline = UILabel(frame: CGRect(x: 10, y: 320, width: (self.wrapper!.frame.size.width)-20, height: 28))
        sixthline.text = "SOMETHING"
        sixthline.textColor = UIColor.blackColor()
        sixthline.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.wrapper!.addSubview(sixthline)
        
        var seventhLine = UILabel(frame: CGRect(x: 10, y: 380, width: (self.wrapper!.frame.size.width)-20, height: 28))
        seventhLine.text = "SPICY"
        seventhLine.textColor = UIColor.whiteColor()
        seventhLine.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        seventhLine.userInteractionEnabled = true
        self.wrapper!.addSubview(seventhLine)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
