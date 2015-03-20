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

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sentenceView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Background color
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.orangeColor().CGColor, UIColor.redColor().CGColor]
        gradient.startPoint = CGPointMake(0, 0)
        gradient.endPoint = CGPointMake(0, 1)
        gradient.locations = [0.4,0.99]
        gradient.frame = self.view.frame
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
