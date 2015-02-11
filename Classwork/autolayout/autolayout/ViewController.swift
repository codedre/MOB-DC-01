//
//  ViewController.swift
//  autolayout
//
//  Created by Andre Shonubi on 2/9/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var virticalSpacingBetweenPurpleGhostAndPacman: NSLayoutConstraint!
    
    @IBOutlet weak var robotMouth: UIView!
    
    @IBAction func increaseDistanceBetweenPacmanAndGhost(sender: AnyObject) {
        self.virticalSpacingBetweenPurpleGhostAndPacman.constant
            = 100
        UIView.animateWithDuration(1, animations: {self.view.layoutIfNeeded()})
        
        
    }
    
    @IBAction func swipeRightOnMouth(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: {self.robotMouth.backgroundColor = UIColor.blueColor()})
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

