//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var numberInputField: UITextField!
    @IBOutlet weak var oddEvenResultsLabel: UILabel!
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    @IBAction func calculatesOddOrEvenNumber(sender: AnyObject) {
        var numberValue = numberInputField.text.toInt()
        
        if numberValue! % 2 == 0 {
            oddEvenResultsLabel.text = "\(numberValue!) is even"
        } else {
            oddEvenResultsLabel.text = "\(numberValue!) is not even"
        }
        
    }
}
