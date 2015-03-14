//
//  UserViewController.swift
//  Whisperer
//
//  Created by Andre Shonubi on 3/11/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    @IBAction func loginButton(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(self.usernameTextfield.text, password: self.passwordTextfield.text) { (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                self.feedbackLabel.text = "Successfully logged in!"
            }else {
                self.feedbackLabel.text = "Error logging in!"
            }
        }
    }
    
    @IBAction func registerButton(sender: AnyObject) {
        var user = PFUser()
        user.username = self.usernameTextfield.text
        user.password = self.passwordTextfield.text
        user.email = self.usernameTextfield.text
        
        user.signUpInBackgroundWithBlock { (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                self.feedbackLabel.text = "Successfully signed up!"
                self.usernameTextfield.text = ""
                self.passwordTextfield.text = ""
                
            } else {
                let userError = error.userInfo!["error"] as? String
                self.feedbackLabel.text = userError
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentUser = PFUser.currentUser()
        
        if currentUser != nil {
            println("You are logged in!")
            println(currentUser)
        } else {
            println("not logged in!")
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
