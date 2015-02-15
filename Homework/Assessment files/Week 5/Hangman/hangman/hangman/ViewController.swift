//
//  ViewController.swift
//  hangman
//
//  Created by Andre Shonubi on 2/12/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import QuartzCore
class ViewController: UIViewController, UITextFieldDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawViews()
 
    }
    
    
    func drawViews(){
        
//        Title Lable
        var titleLabel = UILabel(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 30))
        titleLabel.text = "Hangman"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleBottomMargin
        self.view.addSubview(titleLabel)
        
//        TextField for guess entry
        var guessEntryTextField = UITextField(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 30))
        var myColor: UIColor = UIColor.redColor()
        guessEntryTextField.layer.cornerRadius = 8.0
        guessEntryTextField.layer.masksToBounds = true
        guessEntryTextField.layer.borderColor = myColor.CGColor
        guessEntryTextField.layer.borderWidth = 1.0
        guessEntryTextField.textAlignment = NSTextAlignment.Center
        guessEntryTextField.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleWidth
        guessEntryTextField.placeholder = "Enter your single letter guess here"
        guessEntryTextField.delegate = self
        self.view.addSubview(guessEntryTextField)
        
//        Button for submitting guesses
        var submitGuessButton = UIButton(frame: CGRect(x: 140, y: 250, width: 100, height: 70))
        submitGuessButton.setTitle("Guess", forState: .Normal)
        submitGuessButton.addTarget(self, action:"checkGuess:", forControlEvents: .TouchUpInside)
        submitGuessButton.backgroundColor = UIColor.grayColor()
        submitGuessButton.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleBottomMargin
        self.view.addSubview(submitGuessButton)
        
    }
    
    
    
    //Sets textfield to only accept one character
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            let newLength = countElements(textField.text!) + countElements(string) - range.length
            return newLength <= 1
    }

}

