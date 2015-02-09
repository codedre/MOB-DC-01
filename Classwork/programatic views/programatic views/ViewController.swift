//
//  ViewController.swift
//  programatic views
//
//  Created by Andre Shonubi on 2/4/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var redBox = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        redBox.backgroundColor = UIColor.redColor()
        redBox.layer.cornerRadius = 50
        redBox.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleBottomMargin
        self.view.addSubview(redBox)
        
        var redBoxLabel = UILabel(frame: CGRect(x: 0, y: 50, width: redBox.frame.width, height: 30))
        redBoxLabel.text = "Hello World"
        redBoxLabel.backgroundColor = UIColor.yellowColor()
        redBoxLabel.textColor = UIColor.whiteColor()
        redBox.addSubview(redBoxLabel)
        redBoxLabel.textAlignment = .Right
        
        
        var actionBtn = UIButton(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: 30))
        actionBtn.setTitle("Click Me", forState: .Normal)
        actionBtn.addTarget(self, action: "pressedCodedBtn:", forControlEvents: .TouchUpInside)
        self.view.addSubview(actionBtn)
        actionBtn.backgroundColor = UIColor.blueColor()
        actionBtn.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
//        var enaImg = UIImage(named: "ena.jpg")
//        var enaImgView = UIImageView(image: enaImg)
//        enaImgView.frame = CGRect(x: 0, y: 350, width: 200, height: 200)
//        enaImgView.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleRightMargin
//        self.view.addSubview(enaImgView)
        
        var boxScrollView = UIScrollView(frame: CGRect(x: 50, y: 350, width: 200, height: 300))
        boxScrollView.backgroundColor = UIColor.grayColor()
        boxScrollView.contentSize = CGSize(width: 200, height: 600)
        self.view.addSubview(boxScrollView)
        
        
        var greenBox = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        greenBox.backgroundColor = UIColor.greenColor()
        
        var yellowBox = UIView(frame: CGRect(x: 0, y: 150, width: 200, height: 150))
        yellowBox.backgroundColor = UIColor.yellowColor()
        
        var purpleBox = UIView(frame: CGRect(x: 0, y: 300, width: 200, height: 150))
        purpleBox.backgroundColor = UIColor.purpleColor()
        
        
        boxScrollView.addSubview(greenBox)
        boxScrollView.addSubview(yellowBox)
        boxScrollView.addSubview(purpleBox)
    }
    
    func pressedCodedBtn(sender: UIButton){
        println("hello world")
        sender.removeFromSuperview()
    }



}

