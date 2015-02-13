//
//  ViewController.swift
//  programatic autolayout
//
//  Created by Andre Shonubi on 2/11/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var body = UIView()
    @IBOutlet weak var head: UIView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBody()
        
        var leftArm = UIView()
        leftArm.backgroundColor = UIColor.blackColor()
        self.view.addSubview(leftArm)
        
        // Not neccerary if one constraint is set in IB when doing half code/half IB
        leftArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let leftArmHeight = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 30)
        
        let leftArmTop = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Top, //top of body
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom, //bottom of head
            multiplier: 1,
            constant: 0.0)
        
        let leftArmLeading  = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Leading, //top of body
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Leading, //bottom of head
            multiplier: 1,
            constant: 20.0)
        
        let leftArmTrailing  = NSLayoutConstraint(
            item: leftArm,
            attribute: NSLayoutAttribute.Trailing, //top of body
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body    ,
            attribute: NSLayoutAttribute.Left, //bottom of head
            multiplier: 1,
            constant: 0.0)
        
        self.view.addConstraints([leftArmHeight,leftArmLeading,leftArmTop, leftArmTrailing])
        
        
        var rightArm = UIView()
        rightArm.backgroundColor = UIColor.blackColor()
        self.view.addSubview(rightArm)
        
        rightArm.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let rightArmHeight = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftArm,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 0)
        
        let rightArmTop = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Top, //top of body
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom, //bottom of head
            multiplier: 1,
            constant: 0.0)
        
        let rightArmLeading  = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Leading, //top of body
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Right, //bottom of head
            multiplier: 1,
            constant: 0.0)
        
        let rightArmTrailing  = NSLayoutConstraint(
            item: rightArm,
            attribute: NSLayoutAttribute.Trailing, //top of body
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Trailing, //bottom of head
            multiplier: 1,
            constant: -20.0)
        
        self.view.addConstraints([rightArmHeight,rightArmLeading,rightArmTop, rightArmTrailing])
        
        
        var leftLeg = UIView()
        leftLeg.backgroundColor = UIColor.redColor()
        self.view.addSubview(leftLeg)
        
        leftLeg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let leftLegHeight = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 120.0)
        
        let leftLegWidth = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0.0)
        
        let leftLegbottom = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant:0.0)
        
        let leftLegTrailing = NSLayoutConstraint(
            item: leftLeg,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant:0.0)
        
        self.view.addConstraints([leftLegTrailing,leftLegbottom,leftLegWidth, leftLegHeight])
        
        var rightLeg = UIView()
        rightLeg.backgroundColor = UIColor.redColor()
        self.view.addSubview(rightLeg)
        
        rightLeg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let rightLegHeight = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 120.0)
        
        let rightLegWidth = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0.0)
        
        let rightLegbottom = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant:0.0)
        
        let rightLegLeading = NSLayoutConstraint(
            item: rightLeg,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.body,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant:0.0)
        
        self.view.addConstraints([rightLegLeading,rightLegbottom,rightLegWidth, rightLegHeight])
        
        
        let bodyBottomPosition = NSLayoutConstraint(
            item: self.body,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftLeg,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant:0.0)
        
        self.view.addConstraint(bodyBottomPosition)
        
        
    }
    
    func createBody(){
        self.body.backgroundColor = UIColor.greenColor()
        
        // Need to add subview before adding constraints
        self.view.addSubview(self.body)
        
        //Default to use autoconstraint /*NEVER FORGET*/
        self.body.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // Constraints for the body
        let bodywidth = NSLayoutConstraint(
            item: self.body,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head, // if you want to get properites from another item (or nil)
            attribute: NSLayoutAttribute.Width,
            multiplier: 0.5,
            constant: 0.0)
        
        let bodyVirticalPosition = NSLayoutConstraint(
            item: self.body,
            attribute: NSLayoutAttribute.Top, //top of body
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Bottom, //bottom of head
            multiplier: 1,
            constant: 0.0)
        
        let bodyHorizontalPosition = NSLayoutConstraint(
            item: self.body,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.head,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: 22.5)
        
        
        // constraint one, constraints array for many
        self.view.addConstraints([bodywidth,bodyHorizontalPosition,bodyVirticalPosition])
    }

    
}

