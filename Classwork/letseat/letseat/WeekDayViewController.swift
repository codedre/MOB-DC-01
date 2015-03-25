//
//  WeekDayViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/25/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import Snap

class WeekDayViewController: UIViewController {
    
    var slidingViews = [SlidingHoursViewController]()
    var activeView:SlidingHoursViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sunday = OpeningTime(day: "Sunday", time: "8AM - 8PM")
        let monday = OpeningTime(day: "Monday", time: "8AM - 10PM")
        let tuesday = OpeningTime(day: "Tuesday", time: "10AM - 12AM")
        let wednesday = OpeningTime(day: "Wednesday", time: "FOO - BAR")
        let thursday = OpeningTime(day: "Thursday", time: "WHATS - UP")
        let friday = OpeningTime(day: "Friday", time: "8AM - 8PM")
        let saturday = OpeningTime(day: "Saturdat", time: "3AM - 2PM")
        
        let tooLazyToType = [sunday, monday, tuesday, wednesday, thursday, friday, saturday]
        
        var previousSlidingHoursView:SlidingHoursViewController?
        for var i = 0; i < tooLazyToType.count; i++ {
            let shvc = SlidingHoursViewController()
            shvc.view.setTranslatesAutoresizingMaskIntoConstraints(false)
            shvc.view.clipsToBounds = true
            shvc.view.backgroundColor = UIColor.yellowColor()
            shvc.information = tooLazyToType[i]
            self.view.addSubview(shvc.view)
            
            shvc.view.snp_makeConstraints({ (make) -> () in
                make.width.equalTo(200)
                make.height.equalTo(44)
                make.centerX.equalTo(self.view.snp_centerX)
                
                if previousSlidingHoursView != nil {
                    make.top.equalTo(previousSlidingHoursView!.view.snp_bottom).with.offset(20)
                } else {
                    make.top.equalTo(20)
                }
            })
            
            let tapGesture = UITapGestureRecognizer(target: self, action: "viewTapped:")
            shvc.view.addGestureRecognizer(tapGesture)
            
            self.slidingViews.append(shvc)
            shvc.view.tag = i
            
            previousSlidingHoursView = shvc
        }
    }
    
    func viewTapped(sender: UITapGestureRecognizer) {
        if self.activeView != nil {
            self.activeView?.slideToDay()
        }
        
        let slidingViewTapped = self.slidingViews[sender.view!.tag]
        if (slidingViewTapped != self.activeView) {
            self.activeView = self.slidingViews[sender.view!.tag]
            self.activeView?.slideToHour()
        } else {
            self.activeView = nil
        }
        
    }

}
