//
//  ViewController.swift
//  CoreList
//
//  Created by Mollie on 2/24/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var itemNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func saveItem(sender: AnyObject) {
        
        let applicationDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var postObject = NSEntityDescription.insertNewObjectForEntityForName("Items", inManagedObjectContext: applicationDelegate.managedObjectContext!) as NSManagedObject
        
        postObject.setValue(itemNameField.text, forKey: "name")
        postObject.setValue(NSDate(), forKey: "created")
        postObject.setValue(false, forKey: "completed")
        
        // save item to core data
        applicationDelegate.saveContext()
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelItem(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

