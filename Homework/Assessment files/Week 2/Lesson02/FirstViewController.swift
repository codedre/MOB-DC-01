//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var enterNameField: UITextField!
    @IBOutlet weak var enterAgeField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var ageSpecificLabel: UILabel!
    
    /*TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’*/
    
    @IBAction func generateHelloWord(sender: AnyObject) {
        resultLabel.text = "hello world!"
    }
    
    /*TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!"*/
    // ******* This part is not complete
    
    @IBAction func displayNameAndAgeFromFields(sender: AnyObject) {
        
        if enterNameField.text == "" || enterAgeField.text == "" {
            resultLabel.text = "hello world!"
        } else{
        resultLabel.text = "Hello \(enterNameField.text), you are \(enterAgeField.text) years old!"
        }
    }
    
    
    //*TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”*/
    
    @IBAction func displayAgeSpecificMessage(sender: AnyObject) {
        var age = enterAgeField.text.toInt()
        
        if enterNameField.text == "" || enterAgeField.text == "" {
            resultLabel.text = "hello world!"
        } else{
            resultLabel.text = "Hello \(enterNameField.text), you are \(enterAgeField.text) years old!"
            if age! >= 21{
                ageSpecificLabel.text = "You can drink"
            } else if age! >= 18 {
                ageSpecificLabel.text = "You can vote"
            } else if age! >= 16 {
                ageSpecificLabel.text = "You can drive"
            }
        }
    }
    
    
    /*TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.*/
    
    // ****** One error here which applies to all situations where you are doing toInt() in this assessment (won't count this against you, just keep in mind for future reference). If user enters anything but a number in the age field the app crashes because you are unwrapping the optional (age) without checking if it has a value or if it's nil. This is a great place to conditionall unwrap the age optional.
    // ****** ex: if let ageCheck = age {
    // ****** now if age is not nil, you can use ageCheck to run the rest of your logic with the unwrapped value
    @IBAction func displayDetailedAgeSpecificMessage(sender: AnyObject) {
        var age = enterAgeField.text.toInt()
        
        if enterNameField.text == "" || enterAgeField.text == "" {
            resultLabel.text = "hello world!"
        } else{
            resultLabel.text = "Hello \(enterNameField.text), you are \(enterAgeField.text) years old!"
            if age! >= 21{
                ageSpecificLabel.text = "You can drive, vote and drink (but not at the same time!)"
            } else if age! >= 18 && age! < 21 {
                ageSpecificLabel.text = "You can drive and vote"
            } else if age! >= 16 && age! < 18 {
                ageSpecificLabel.text = "You can drive"
            }
        }
    }
    
}
