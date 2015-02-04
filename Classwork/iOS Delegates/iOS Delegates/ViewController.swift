//
//  ViewController.swift
//  iOS Delegates
//
//  Created by Andre Shonubi on 2/2/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var stuffTextField: UITextField!
    @IBOutlet weak var campusesTable: UITableView!
    var gaCampuses:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if gaCampuses.isEmpty {
            println("Your table view is empty")
            campusesTable.hidden = true
        }
        //
        //1. add UITextFieldDelegate protocal
        //2. connect Text field outlet
        //3. Tie textfield.delegate = self
        //4. Add the text field method
        
        stuffTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("Return key pressed")
        stuffTextField.resignFirstResponder()
        return true
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Sets the number of cells in the table to equal the number of items in our array
        return self.gaCampuses.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell ?? UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
        // Sets each cell to equal each item in the array
        
        cell.textLabel?.text = self.gaCampuses[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //removes it from the array and the view when array is specified
            self.gaCampuses.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }


}

