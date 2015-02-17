//
//  ViewController.swift
//  BalanceBall
//
//  Created by Mollie on 2/16/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager = CMMotionManager()
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    @IBOutlet var ballView: View!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collision = UICollisionBehavior(items: [ballView])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        // gravity direction
        // delta point pins it to the center
        // replace deltapoint line with gravity
        animator = UIDynamicAnimator(referenceView: ballView)
        gravity = UIGravityBehavior(items: [ballView])
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (deviceMotion, error) -> Void in
            
            let rotation = deviceMotion.rotationRate
            let attitude = deviceMotion.attitude
            let acceleration = deviceMotion.userAcceleration
            
            //            let altitude = deviceMotion.
            //            let magnetic = deviceMotion.magneticField
            
            let scale:Double = 10
            
//            self.ballView.deltaPoint = (CGFloat(attitude.roll * scale), CGFloat(attitude.pitch * scale))
            
            self.gravity.gravityDirection = CGVectorMake(CGFloat(attitude.roll * scale), CGFloat(attitude.pitch * scale))
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

