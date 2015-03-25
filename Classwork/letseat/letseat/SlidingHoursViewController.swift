//
//  SlidingHoursViewController.swift
//  foobarandre
//
//  Created by LOANER on 3/25/15.
//  Copyright (c) 2015 Thomas Degry. All rights reserved.
//

import UIKit
import Snap

class SlidingHoursViewController: UIViewController {
    var dayLabel:UILabel?
    var hourLabel:UILabel?
    var dayLabelLeftConstraint:NSLayoutConstraint?
    
    var information:OpeningTime? {
        didSet {
            updateLabels()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create day label
        self.dayLabel = UILabel(frame: CGRectZero)
        self.dayLabel?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.dayLabel?.textAlignment = .Center
        self.view.addSubview(self.dayLabel!)
        
        self.dayLabel?.snp_makeConstraints({ (make) -> () in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(self.view.snp_height)
            make.top.equalTo(0)
        })
        
        // Create layout constraint for left seperatly so we can reference it
        self.dayLabelLeftConstraint = NSLayoutConstraint(item: self.dayLabel!, attribute: .Left, relatedBy: .Equal, toItem: nil, attribute: .Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(self.dayLabelLeftConstraint!)
        
        self.hourLabel = UILabel(frame: CGRectZero)
        self.hourLabel?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.hourLabel?.textAlignment = .Center
        self.view.addSubview(self.hourLabel!)
        
        self.hourLabel?.snp_makeConstraints({ (make) -> () in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(self.view.snp_height)
            make.left.equalTo(self.dayLabel!.snp_right)
            make.top.equalTo(0)
        })
    }
    
    func slideToDay() {
        self.dayLabelLeftConstraint?.constant = 0
        UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func slideToHour() {
        self.dayLabelLeftConstraint?.constant = -self.view.frame.size.width
        UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    func updateLabels() {
        // Update the labels
        self.dayLabel?.text = self.information?.day
        self.hourLabel?.text = self.information?.time
    }

}
