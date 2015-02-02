//
//  ViewController.swift
//  Scare the Bug
//
//  Created by Mollie on 1/27/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.width

class ViewController: UIViewController {
    
    var bug = UIImageView(frame: CGRectMake(0, 0, 60, 50))
    
    var foot: CGFloat = 1
    var lastFootPrint = CGPointZero

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bug.image = UIImage(named: "bug")
        bug.center = view.center
        
        view.addSubview(bug)
        
        NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "footPrints", userInfo: nil, repeats: true)
        
    }
    
    func footPrints() {
        
        if var presentationLayer: AnyObject! = bug.layer.presentationLayer() {
            
            var center = CGPointMake(CGRectGetMidX(presentationLayer.frame), CGRectGetMidY(presentationLayer.frame))
            
            var xDist = (center.x - lastFootPrint.x)
            var yDist = (center.y - lastFootPrint.y)
            var distance = sqrt((xDist * xDist) + (yDist * yDist))
            
            if fabs(distance) < 10 { return }
            
            var footPrint = UIView(frame: CGRectMake(0, 0, 6, 6))
            footPrint.backgroundColor = UIColor.blackColor()
            footPrint.layer.cornerRadius = 3
            footPrint.center = CGPointMake(center.x + (foot * 3), center.y + (foot * 3))
            
            lastFootPrint = footPrint.center
            
            view.insertSubview(footPrint, atIndex: 0)
            
        }
        
        foot = foot == -1 ? 1 : -1;
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        if let touch = touches.allObjects.first as? UITouch {
            
            let location = touch.locationInView(view)
            
            var (x, y) = (bug.center.x - location.x, bug.center.y - location.y)
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                if (fabs(x) > fabs(y)) {
                    self.bug.center.x += (SCREEN_WIDTH / x)
                } else {
                    self.bug.center.x += (SCREEN_WIDTH / x / 2)
                }
                if (fabs(x) < fabs(y)) {
                    self.bug.center.y += (SCREEN_HEIGHT / y)
                } else {
                    self.bug.center.y += (SCREEN_HEIGHT / y / 2)
                }
                
            })
            
        }
        
    }


}