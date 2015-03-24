//
//  CreateMoodSecondViewController.swift
//  letseat
//
//  Created by Andre Shonubi on 3/23/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

protocol MoodOptions {
    func selectedMood(title: String)
}

class CreateMoodSecondViewController: UIViewController {

    var wrapper: UIView?
    var delegate: MoodOptions?
    
    
    var firstOpt = UIButton()
    var secondOpt = UIButton()
    var thirdOpt = UIButton()
    var fourthOpt = UIButton()
    var fifthOpt = UIButton()
    var sixthOpt = UIButton()
    var seventhOpt = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawWrapper()
        drawOptions()
        
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
        self.wrapper = UIView(frame: CGRect(x: 10, y: 50, width: (self.view.frame.size.width)-20, height: 430))
        self.wrapper?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        self.wrapper?.layer.cornerRadius = 20
        
        self.view.addSubview(self.wrapper!)
    }
    
    func drawOptions() {
        self.firstOpt = UIButton(frame: CGRect(x: 10, y: 20, width: (self.wrapper!.frame.size.width)-20, height: 28))
        self.firstOpt.setTitle("HAPPY", forState: .Normal)
        self.firstOpt.addTarget(self, action: "getOption:", forControlEvents: .TouchUpInside)
        self.firstOpt.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.firstOpt.titleLabel?.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.firstOpt.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.firstOpt.tag = 1
        self.wrapper?.addSubview(self.firstOpt)
        
        self.secondOpt = UIButton(frame: CGRect(x: 10, y: 80, width: (self.wrapper!.frame.size.width)-20, height: 28))
        self.secondOpt.setTitle("SAD", forState: .Normal)
        self.secondOpt.addTarget(self, action: "getOption:", forControlEvents: .TouchUpInside)
        self.secondOpt.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.secondOpt.titleLabel?.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.secondOpt.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.secondOpt.tag = 2
        self.wrapper?.addSubview(self.secondOpt)
        
        self.thirdOpt = UIButton(frame: CGRect(x: 10, y: 140, width: (self.wrapper!.frame.size.width)-20, height: 28))
        self.thirdOpt.setTitle("SICK", forState: .Normal)
        self.thirdOpt.addTarget(self, action: "getOption:", forControlEvents: .TouchUpInside)
        self.thirdOpt.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.thirdOpt.titleLabel?.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.thirdOpt.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.thirdOpt.tag = 3
        self.wrapper?.addSubview(self.thirdOpt)
        
        self.fourthOpt = UIButton(frame: CGRect(x: 10, y: 200, width: (self.wrapper!.frame.size.width)-20, height: 28))
        self.fourthOpt.setTitle("SPONTANEOUS", forState: .Normal)
        self.fourthOpt.addTarget(self, action: "getOption:", forControlEvents: .TouchUpInside)
        self.fourthOpt.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.fourthOpt.titleLabel?.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.fourthOpt.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.fourthOpt.tag = 4
        self.wrapper?.addSubview(self.fourthOpt)
        
        self.fifthOpt = UIButton(frame: CGRect(x: 10, y: 260, width: (self.wrapper!.frame.size.width)-20, height: 28))
        self.fifthOpt.setTitle("HIGH", forState: .Normal)
        self.fifthOpt.addTarget(self, action: "getOption:", forControlEvents: .TouchUpInside)
        self.fifthOpt.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.fifthOpt.titleLabel?.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.fifthOpt.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.fifthOpt.tag = 5
        self.wrapper?.addSubview(self.fifthOpt)
        
        self.sixthOpt = UIButton(frame: CGRect(x: 10, y: 320, width: (self.wrapper!.frame.size.width)-20, height: 28))
        self.sixthOpt.setTitle("DRUNK", forState: .Normal)
        self.sixthOpt.addTarget(self, action: "getOption:", forControlEvents: .TouchUpInside)
        self.sixthOpt.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.sixthOpt.titleLabel?.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.sixthOpt.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.sixthOpt.tag = 6
        self.wrapper?.addSubview(self.sixthOpt)
        
        self.seventhOpt = UIButton(frame: CGRect(x: 10, y: 380, width: (self.wrapper!.frame.size.width)-20, height: 28))
        self.seventhOpt.setTitle("LAZY", forState: .Normal)
        self.seventhOpt.addTarget(self, action: "getOption:", forControlEvents: .TouchUpInside)
        self.seventhOpt.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.seventhOpt.titleLabel?.font = UIFont(name: "AvenirNext-Heavy", size: 33.0)
        self.seventhOpt.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.seventhOpt.tag = 7
        self.wrapper?.addSubview(self.seventhOpt)
    }
    
    func getOption(sender:UIButton){
        
        switch sender.tag {
        case 1:
            var option = self.firstOpt.currentTitle
            self.delegate?.selectedMood(option!)
            self.view.hidden = true
            case 2:
            var option = self.secondOpt.currentTitle
            self.delegate?.selectedMood(option!)
            self.view.hidden = true
        case 3:
            var option = self.thirdOpt.currentTitle
            self.delegate?.selectedMood(option!)
            self.view.hidden = true
        case 4:
            var option = self.fourthOpt.currentTitle
            self.delegate?.selectedMood(option!)
            self.view.hidden = true
        case 5:
            var option = self.fifthOpt.currentTitle
            self.delegate?.selectedMood(option!)
            self.view.hidden = true
        case 6:
            var option = self.sixthOpt.currentTitle
            self.delegate?.selectedMood(option!)
            self.view.hidden = true
        case 7:
            var option = self.seventhOpt.currentTitle
            self.delegate?.selectedMood(option!)
            self.view.hidden = true

        default:
            return
        }
        
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
