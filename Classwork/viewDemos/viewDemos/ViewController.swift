//
//  ViewController.swift
//  viewDemos
//
//  Created by Andre Shonubi on 1/21/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mySquare: UIView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func swipeSquareRight(sender: UISwipeGestureRecognizer) {
        UIView.animateWithDuration(1.5, animations: {
            self.mySquare.backgroundColor = UIColor.redColor()
            self.mySquare.alpha = 0.5
            
        })
    }
    
    @IBAction func swipeSquareLeft(sender: UISwipeGestureRecognizer) {
        println("swipe left")
        UIView.animateWithDuration(1.5, animations: {
            self.mySquare.backgroundColor = UIColor.greenColor()
            
            
        })
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

