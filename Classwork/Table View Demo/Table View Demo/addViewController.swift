//
//  addViewController.swift
//  Table View Demo
//
//  Created by Andre Shonubi on 1/28/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

//protocal are like nouns
protocol Campus {
    func addCampusToArray(campusName: String)
}

class addViewController: UIViewController {
    
    @IBOutlet weak var addTextBox: UITextField!
//    delegate always needs to be optional and is refering to the other view controller
    var delegate: Campus?

    @IBAction func saveAndGoBack(sender: AnyObject) {
        
        self.delegate?.addCampusToArray(addTextBox.text)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
