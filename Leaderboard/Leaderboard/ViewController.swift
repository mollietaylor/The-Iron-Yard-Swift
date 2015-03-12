//
//  ViewController.swift
//  Leaderboard
//
//  Created by Mollie on 3/4/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController, GKGameCenterControllerDelegate {
    
    var attacks: Int64 = 0

    @IBOutlet weak var attackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GKLocalPlayer.localPlayer().authenticateHandler = { (viewController: UIViewController!, error: NSError!) -> Void in
            
            if !GKLocalPlayer.localPlayer().authenticated {
                
                self.presentViewController(viewController, animated: true, completion: nil)
                
            }
            
            println("authentication done = \(GKLocalPlayer.localPlayer().authenticated)")
            // local player is authenticated
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController!) {
        
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil) // unpause game here
        
    }

    @IBAction func attack(sender: AnyObject) {
        
        attacks++
        
        // update label
        attackLabel.text = "Attacks: \(attacks)"
        
        // submit high attack score
        var score = GKScore(leaderboardIdentifier: "attack-leaderboard") // matches info on iTunes connect
        score.value = attacks
        GKScore.reportScores([score], withCompletionHandler: { (error) -> Void in
            
            println("score reported")
            
        })
        
    }
    
    @IBAction func viewLeaderboard(sender: AnyObject) {
        
        // stop present if user is not authenticated using GKLocalPlayer.localPlayer().authenticated
        
        // present leaderboard
        var leaderboardVC = GKGameCenterViewController()
        leaderboardVC.leaderboardIdentifier = "attack_leaderboard" // matches info on iTunes Connect
        leaderboardVC.gameCenterDelegate = self
        
        presentViewController(leaderboardVC, animated: true, completion: nil)
        
    }

}

