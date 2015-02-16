//
//  TableViewController.swift
//  MotionSickness
//
//  Created by Mollie on 2/16/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import CoreMotion

func roundToDecimal(d: Double, places: Int) -> Double {
    let number = pow(10, Double(places))
    
    return round(d * number) / number
    
}

class TableViewController: UITableViewController {
    
    var motionManager = CMMotionManager()
    
    @IBOutlet weak var rotationZLabel: UILabel!
    @IBOutlet weak var rotationXLabel: UILabel!
    @IBOutlet weak var rotationYLabel: UILabel!
    @IBOutlet weak var accelerationZLabel: UILabel!
    @IBOutlet weak var accelerationXLabel: UILabel!
    @IBOutlet weak var accelerationYLabel: UILabel!
    @IBOutlet weak var yawLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var rollLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var magneticFieldLabel: UILabel!
    
    @IBOutlet weak var rotationXYView: DeltaView!
    @IBOutlet weak var rotationXZView: DeltaView!
    @IBOutlet weak var rotationZYView: DeltaView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (deviceMotion, error) -> Void in
            
            let rotation = deviceMotion.rotationRate
            let attitude = deviceMotion.attitude
            let acceleration = deviceMotion.userAcceleration
            
//            let altitude = deviceMotion.
//            let magnetic = deviceMotion.magneticField
            
            let scale:Double = 10
            
            self.rotationXYView.deltaPoint = (CGFloat(attitude.pitch * scale), CGFloat(attitude.roll * scale))
            self.rotationXZView.deltaPoint = (CGFloat(attitude.pitch * scale), CGFloat(attitude.yaw * scale))
            self.rotationZYView.deltaPoint = (CGFloat(attitude.yaw * scale), CGFloat(attitude.roll * scale))
            
            self.rotationZLabel.text = "z: \(roundToDecimal(rotation.z, 3))"
            self.rotationXLabel.text = "x: \(roundToDecimal(rotation.x, 3))"
            self.rotationYLabel.text = "y: \(roundToDecimal(rotation.y, 3))"
            self.accelerationZLabel.text = "z: \(roundToDecimal(acceleration.z, 3))"
            self.accelerationXLabel.text = "x: \(roundToDecimal(acceleration.x, 3))"
            self.accelerationYLabel.text = "y: \(roundToDecimal(acceleration.y, 3))"
            
//            if let attitude = attitude {
//                self.yawLabel.text = "yaw: \(roundToDecimal(attitude.yaw, 3))"
//                self.pitchLabel.text = "pitch: \(roundToDecimal(attitude.pitch, 3))"
//                self.rollLabel.text = "roll: \(roundToDecimal(attitude.roll, 3))"
//            }
//            self.magneticFieldLabel.text = "\(roundToDecimal(magnetic, 3))"
            
            
        })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

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
