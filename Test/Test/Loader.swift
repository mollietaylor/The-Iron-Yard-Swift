////
////  Loader.swift
////  Test
////
////  Created by Mollie on 2/27/15.
////  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
////
//
//import UIKit
//
//// add a variable to set circle color
//// makes circles 50% alpha
//// make 3 circles (means you need 3 directions & circlePercentages)
//// also means you need to update all three circles on runLoop
//
//class Loader: UIView {
//    
//    var a: CGFloat = 1
//    
//    var circleScale: CGFloat = 100
//    
//    var direction: CGFloat = -100
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        backgroundColor = UIColor.clearColor()
//        
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // Only override drawRect: if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect) {
//        // Drawing code
//        
//        let center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
//        
//        var half = rect.width > rect.height ? rect.height / 2 : rect.width / 2
//        
//        half *= circleScale / 100
//        
//        var context = UIGraphicsGetCurrentContext()
//        
//        UIColor(red:1, green:0.39, blue:0, alpha:1).colorWithAlphaComponent(a).set()
//        
//        let circleRect = CGRectMake(center.x - (half / 2), center.y - (half / 2), half, half)
//        
//        CGContextFillEllipseInRect(context, circleRect)
//        
////        CGContextFillRect(context, rect)
//        
//    }
//    
//    var timer: NSTimer?
//    
//    func runLoop() {
//        
//        a += 0.01
//        
//        if a >= 1.0 { a = 0 }
//        
//        circleScale -= direction
//        
//        if circleScale
//        
//        if circleScale >= 100 { circleScale = 0 }
//        
//        setNeedsDisplay()
//        
//    }
//    
//    func startAnimating() {
//        
//        if timer == nil {
//            
//            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "runLoop", userInfo: nil, repeats: true)
//            
//        }
//        
//    }
//    
//    func stopAnimating() {
//        
//        timer?.invalidate()
//        timer = nil
//        
//    }
//
//}
