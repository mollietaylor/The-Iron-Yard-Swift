//
//  DetailTVC.swift
//  PushIt
//
//  Created by Mollie on 3/2/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

// User
// -objectId
// -username


// Message
// -objectId
// -content (text of message sent)
// -date
// -senderId
// -receiverId
// -participants (array of user objectIds)


import UIKit

class DetailTVC: UITableViewController, UITextFieldDelegate {

    var user: PFUser!
    var messages: [PFObject] = []
    
    let messageField = UITextField(frame: CGRectMake(0, 0, 100, 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // run request to grab all messages for the user
        
        let messageQuery = PFQuery(className: "Messages")
        
        messageQuery.whereKey("participants", containsAllObjectsInArray: [user.objectId, PFUser.currentUser().objectId])
        
        messageQuery.findObjectsInBackgroundWithBlock { (messages, error) -> Void in
            
            if messages.count > 0 {
                
                self.messages = messages as [PFObject]
                
            }
            
            self.tableView.reloadData()
            
        }
        
        messageField.delegate = self
        messageField.borderStyle = UITextBorderStyle.RoundedRect
        messageField.frame = CGRectMake(5, 5, navigationController!.toolbar.frame.width - 85, 34)
        
        navigationController?.toolbar.addSubview(messageField)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as UITableViewCell
        
        let message = messages[indexPath.row]
        
        cell.textLabel?.text = message["content"] as? String
        cell.detailTextLabel?.text = message["senderId"] as? String
        
        return cell
        
    }

    @IBAction func sendMessage(sender: AnyObject) {
        
        var message = PFObject(className: "Messages")
        
        message["content"] = messageField.text
        message["senderId"] = PFUser.currentUser().objectId
        message["receiverId"] = user.objectId
        message["participants"] = [PFUser.currentUser().objectId, user.objectId]
        
        message.saveInBackgroundWithBlock(nil)
        
        messages.append(message)
        
        tableView.reloadData()
        
        var deviceQuery = PFInstallation.query()
        deviceQuery.whereKey("userId", equalTo: user.objectId)
        
        var push = PFPush()
        push.setMessage(messageField.text)
        push.setQuery(deviceQuery)
        push.sendPush(nil)
        
        messageField.text = ""
        
    }
    
}

