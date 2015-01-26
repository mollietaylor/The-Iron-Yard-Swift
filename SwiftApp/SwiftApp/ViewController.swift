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
    @IBOutlet weak var warningLabel: UILabel!

    @IBAction func logInWasPressed(sender: UIButton) {
        
        if usernameField.text == "" || passwordField.text == "" || emailField.text == "" {
            
            warningLabel.text = "All fields must be filled in!"
            
        } else {
            
            warningLabel.text = "Logged in!"
            
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

