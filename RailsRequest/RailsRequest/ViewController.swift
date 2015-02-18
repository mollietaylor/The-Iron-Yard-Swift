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
            
            User.currentUser().getUserToken()
            
        }
        
    }


}

