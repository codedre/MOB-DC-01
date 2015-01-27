//
//  ViewController.swift
//  Table views and scenes
//
//  Created by Andre Shonubi on 1/26/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var swipeView: UIView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initiateRightSwipeOnRedBox()
        initiateDoubleTapOnRedbox()
    }
    
    func initiateDoubleTapOnRedbox() {
        
        // making a new instance of UIapGesture
        let dTap = UITapGestureRecognizer(target: self, action: "doubleTapped:")
        //configure number of taps
        dTap.numberOfTapsRequired = 2
        
        //assign tap gesture on box
        self.swipeView.addGestureRecognizer(dTap)
    }
    
    func doubleTapped(sender: UITapGestureRecognizer){
        //change to another view controller modally
        var thirdVC = self.storyboard?.instantiateViewControllerWithIdentifier("thirdVC") as thirdViewController
        //as is a form a typecasting 
        
        //call the view controller, yes always animate, can put extra animation
        self.presentViewController(thirdVC, animated: true, completion: nil)
        
    }
    
    func swipeRight(sender: UISwipeGestureRecognizer){
        //id of seguea, and self target
        self.performSegueWithIdentifier("showSecondVC", sender: self)
    }
    
    func initiateRightSwipeOnRedBox() {
        // : in string means its a func
        let swipeR = UISwipeGestureRecognizer(target: self, action: "swipeRight:")
        
        swipeR.direction = UISwipeGestureRecognizerDirection.Right
        
        self.swipeView.addGestureRecognizer(swipeR)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

