//
//  ViewController.swift
//  SwiftApp
//
//  Created by Mollie on 1/26/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

let RED = UIColor.redColor()
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height



class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!

    @IBAction func logInWasPressed(sender: UIButton) {
        
        var fieldValues: [String] = [usernameField.text,emailField.text,passwordField.text]
        
        if find(fieldValues, "") == nil {
            
            signUp()
            
        } else {
            
            var alertViewController = UIAlertController(title: "Submission Error", message: "All fields need to be filled in", preferredStyle: UIAlertControllerStyle.Alert)
            var defaultAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            alertViewController.addAction(defaultAction)
            
            presentViewController(alertViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func login() {
        PFUser.logInWithUsernameInBackground(usernameField.text, password:passwordField.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                // Do stuff after successful login.
                println("logged in as \(user)")
            } else {
                // The login failed. Check error to see why.
            }
        }
    }
    
    func signUp() {
        
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                println(user)
                
                self.usernameField.text = ""
                self.passwordField.text = ""
                self.emailField.text = ""
                
            } else {
                let errorString = error.userInfo?["error"] as NSString
                // Show the errorString somewhere and let the user try again.
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

