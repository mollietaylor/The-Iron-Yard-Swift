//
//  ViewController.swift
//  FFAController
//
//  Created by Mollie on 2/10/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate {
    
    var session: MCSession!
    var myPeerID: MCPeerID!
    
    var advertiser: MCNearbyServiceAdvertiser!
    
    let serviceType = "Brawling10"
//    let colorR = "0"
//    let colorG = "0.49"
//    let colorB = "0.94"
//    let size = String(arc4random_uniform(40) + 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPeerID = MCPeerID(displayName: "🚴")
        
        session = MCSession(peer: myPeerID)
        session.delegate = self
        
        advertiser = MCNearbyServiceAdvertiser(peer: myPeerID, discoveryInfo: [NSObject: AnyObject](), serviceType: serviceType)
        advertiser.delegate = self
        
        advertiser.startAdvertisingPeer()
        
    }
    
    var lastLocation: CGPoint?
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        if let touch = touches.allObjects.last as? UITouch {
            
            let location = touch.locationInView(view)
            
            if let ll = lastLocation {
                
                let xMove = location.x - ll.x
                let yMove = location.y - ll.y
                
//                sendMove(xMove, y:yMove)
                
            }
            
            lastLocation = location
            
        }
        
    }
    
    var roomPeerID: MCPeerID?
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        
        roomPeerID = peerID
        
        println("invite from \(peerID)")
        
        invitationHandler(true, session)
        
    }
    
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) {
        
        
        
    }
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        
        
        
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        
        
        
    }
    
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        
        
        
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        
        println("\(state.rawValue) = \(peerID)")
        
        println(session.connectedPeers)
        
    }
    
    func moveOrFire(object: [String: AnyObject]) {
        
        let moveData = NSJSONSerialization.dataWithJSONObject(object, options:NSJSONWritingOptions.allZeros, error: nil)
        
        if let roomPeerID = roomPeerID {
            session.sendData(moveData, toPeers: [roomPeerID], withMode: MCSessionSendDataMode.Reliable, error: nil)
        }
        
    }
    
    @IBAction func upPressed(sender: AnyObject) {
        
        moveOrFire(["direction":"up"])
        
    }
    
    @IBAction func leftPressed(sender: AnyObject) {
        
        moveOrFire(["direction":"left"])
        
    }
    
    @IBAction func rightPressed(sender: AnyObject) {
        
        moveOrFire(["direction":"right"])
        
    }
    
    @IBAction func normalPressed(sender: AnyObject) {
        
        moveOrFire(["fire":"normal"])
        
    }
    
    @IBAction func specialPressed(sender: AnyObject) {
        
        moveOrFire(["fire":"special"])
            
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

