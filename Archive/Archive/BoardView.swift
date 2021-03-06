//
//  BoardView.swift
//  Archive
//
//  Created by Mollie on 2/26/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    var dots: [Dot] = []
    
    var color = UIColor.grayColor()
    var diameter: CGFloat = 1

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        for dot in dots {
            
            CGContextSetLineCap(context, kCGLineCapRound)
            CGContextSetLineWidth(context, dot.diameter)
            
            dot.color.set()
            
            CGContextMoveToPoint(context, dot.center.x, dot.center.y)
            CGContextAddLineToPoint(context, dot.center.x, dot.center.y)
            
            CGContextStrokePath(context)
            
        }
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        let red = CGFloat(arc4random_uniform(100)) / 100
        let green = CGFloat(arc4random_uniform(100)) / 100
        let blue = CGFloat(arc4random_uniform(100)) / 100
        
        color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        diameter = 1
        
        addDot(touches)
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        diameter++
        
        addDot(touches)
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        let dotCount = Int(floor(diameter / 2))
        
        let startIndex = dots.count - dotCount
        let endIndex = dots.count
        
        var newDiameter = floor(diameter / 2)
        
        for i in startIndex..<endIndex {
            
            newDiameter--
            
            let dot = dots[i]
            
            dot.diameter = newDiameter
            
        }
        
        setNeedsDisplay()
        
        NSNotificationCenter.defaultCenter().postNotificationName("appIsClosing", object: nil, userInfo: nil)
        
    }
    
    func addDot(touches: NSSet) {
        
        if let touch = touches.allObjects.last as? UITouch {
            
            let location = touch.locationInView(self)
            
            let dot = Dot(center: location, diameter: diameter)
            
            dot.color = color
            
            dots.append(dot)
            
            setNeedsDisplay()
            
        }
        
    }

}
