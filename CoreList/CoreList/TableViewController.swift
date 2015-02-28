//
//  TableViewController.swift
//  CoreList
//
//  Created by Mollie on 2/24/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var items: [AnyObject] = []
    
    let applicationDelegate = UIApplication.sharedApplication().delegate as AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // fetch from core data & reload tableview
        
        let entity = NSEntityDescription.entityForName("Items", inManagedObjectContext: applicationDelegate.managedObjectContext!)
        
        let fetch = NSFetchRequest()
        
        fetch.entity = entity
        
//        let predicate = NSPredicate(format: "completed == true")
//        fetch.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(key: "created", ascending: true)
        fetch.sortDescriptors = [sortDescriptor]
        
        if let results = applicationDelegate.managedObjectContext?.executeFetchRequest(fetch, error: nil) {
            
            items = results
            tableView.reloadData()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as UITableViewCell
        
        let object = items[indexPath.row] as NSManagedObject
        cell.textLabel?.text = object.valueForKey("name") as? String
        
        if let date = object.valueForKey("created") as? NSDate {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "EEEE, MMMM d"
            println(date)
            cell.detailTextLabel?.text = dateFormatter.stringFromDate(date)
            
            if date.timeIntervalSinceNow < -7000 {
                cell.backgroundColor = UIColor.redColor()
            } else if date.timeIntervalSinceNow < -3500 {
                cell.backgroundColor = UIColor.yellowColor()
            } else {
                cell.backgroundColor = UIColor.greenColor()
            }
            
        }
        
        if object.valueForKey("completed") as? Bool == true {
            
            cell.backgroundColor = UIColor.darkGrayColor()
            cell.textLabel?.textColor = UIColor.whiteColor()
            
        }


        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let object = items[indexPath.row] as NSManagedObject
        
        if (object.valueForKey("completed") as? Bool == true) {
            object.setValue(false, forKey: "completed")
        } else {
            object.setValue(true, forKey: "completed")
        }
        
        // save item to core data
        applicationDelegate.saveContext()
        
        // reload table
        tableView.reloadData()
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
