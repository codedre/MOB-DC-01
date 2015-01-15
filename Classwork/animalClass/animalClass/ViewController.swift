//
//  ViewController.swift
//  animalClass
//
//  Created by Andre Shonubi on 1/14/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var inputTextField: UITextField!
    @IBAction func catButton(sender: AnyObject) {
        var cat = Animal()
        cat.species = "cat"
        cat.name = "Tom"
        
        inputTextField.text = cat.stringRepresentation()
    }
    
    @IBAction func dogButton(sender: AnyObject) {
        var dog = Animal()
        dog.species = "dog"
        dog.name = "Fido"
        
        inputTextField.text = dog.stringRepresentation()
    }
    
    

    
    
    @IBAction func submit(sender: AnyObject) {
        var generate = Animal()
        generate.name = nameField.text
        generate.species = typeField.text
        
        inputTextField.text = generate.stringRepresentation()
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

