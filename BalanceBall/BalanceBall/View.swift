//
//  View.swift
//  BalanceBall
//
//  Created by Mollie on 2/16/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

class View: UIView {
    
    var deltaPoint: (CGFloat,CGFloat)? {
        
        didSet { setNeedsDisplay() }
        
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        
        // MARK: Draw circle with point in middle that will act as a bubble level
        var context = UIGraphicsGetCurrentContext()
        
        // center is based on the (0,0) point of the view containing it
//        var point = center
        var point = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
//
        // unwrap delta point optional and let us use the tuple values individually
        if let (x,y) = deltaPoint {
            point.x += x
            point.y += y
        }
        
        // create a point that will be our circle
        CGContextSetLineWidth(context, 10) // diameter
        CGContextSetLineCap(context, kCGLineCapRound) // make it a circle, not a square
        UIColor.redColor().set()
        
        CGContextMoveToPoint(context, point.x, point.y)
        CGContextAddLineToPoint(context, point.x, point.y) // draw point/circle
        
        CGContextStrokePath(context)
        
    }

}
