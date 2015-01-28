//
//  ViewController.swift
//  Scare the Bug
//
//  Created by Mollie on 1/27/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bugView: UIView!
    
//    var bug = UIView()
    var bugLocation:CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func distanceToBug(p1: CGPoint, to p2: CGPoint) -> CGFloat {
        let xDist:CGFloat = (p2.x - p1.x)
        let yDist:CGFloat = (p2.y - p1.y)
        let distance:CGFloat = sqrt((xDist * xDist) + (yDist * yDist));
        
        return distance
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        let touch = touches.allObjects[0] as UITouch
        let touchLocation = touch.locationInView(self.view)
        println(touchLocation)
        var distance = distanceToBug(touchLocation, to: bugView.center)
        println(distance)
        if distance < 200 {
            
            println("bug y: \(bugView.center.y)")
            println("touch y: \(touchLocation.y)")
            
            // bug is above touch
            if bugView.center.y < touchLocation.y {
                
                UIView.animateWithDuration(1.0, animations: {
                    
//                    self.bugView.frame.origin = CGPointMake(self.bugView.center.x, (self.bugView.center.y - 10))
                    self.bugView.center = CGPointMake(self.bugView.center.x, (self.bugView.center.y - 10))
                    println("bug frame: \(self.bugView.frame)")
                    
                    self.view.setNeedsDisplay()
                    
                })
                
                
            }
            
        }
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

