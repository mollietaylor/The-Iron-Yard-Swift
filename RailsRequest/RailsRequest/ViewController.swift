//
//  ViewController.swift
//  RailsRequest
//
//  Created by Mollie on 2/17/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = User.currentUser().token {
            
            println(token)
            
        } else {
            
            // show loginVC
            var signInVC = SignInController()
            presentViewController(signInVC, animated: false, completion: nil)
            
        }
        
    }
    
    func newGame() {
        
        
        
    }


}

class SignInController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func signIn() {
        
        User.currentUser().signIn("mollie@proximityviz.com", password: "password")
        
    }
    
    func register() {
        
        User.currentUser().register("spokes", email: "mollie@proximityviz.com", password: "password")
        
    }
    
    
}

