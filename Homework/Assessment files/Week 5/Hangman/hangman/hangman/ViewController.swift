//
//  ViewController.swift
//  hangman
//
//  Created by Andre Shonubi on 2/12/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit
import QuartzCore

protocol Guess {
    func passGuess(enteredGuess:String)
}

class ViewController: UIViewController, UITextFieldDelegate{
    
    var guessEntryTextField = UITextField()
    var delegate:Guess?
    

    @IBAction func submitGuessButton(sender: AnyObject) {
        
        //makes sure that only letters are accepted in text field
        if self.guessEntryTextField.text.isEmpty {}
        else {
            var num = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
            for number in self.guessEntryTextField.text {
                if contains(num, String(number)) {
//                   add warning label you must enter a letter
                }else {
                    self.delegate?.passGuess(self.guessEntryTextField.text)
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawViews()
 
    }
    
    
    func drawViews(){
        
//        Title Label
        var titleLabel = UILabel(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 30))
        titleLabel.text = "Hangman"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleBottomMargin
        self.view.addSubview(titleLabel)
        
//        TextField for guess entry
        self.guessEntryTextField = UITextField(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 30))
        var myColor: UIColor = UIColor.redColor()
        self.guessEntryTextField.layer.cornerRadius = 8.0
        self.guessEntryTextField.layer.masksToBounds = true
        self.guessEntryTextField.layer.borderColor = myColor.CGColor
        self.guessEntryTextField.layer.borderWidth = 1.0
        self.guessEntryTextField.textAlignment = NSTextAlignment.Center
        self.guessEntryTextField.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleWidth
        self.guessEntryTextField.placeholder = "Enter your single letter guess here"
        self.guessEntryTextField.delegate = self
        self.view.addSubview(guessEntryTextField)
        
    }
    
    
    
    //Sets textfield to only accept one character
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            let newLength = countElements(textField.text!) + countElements(string) - range.length
            return newLength <= 1
    }

}

