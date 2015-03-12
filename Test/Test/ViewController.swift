//
//  ViewController.swift
//  Test
//
//  Created by Mollie on 2/27/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loaderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rotateView(loaderView, duration: 6)
//
//        var l = Loader(frame: CGRectMake(20, 20, 200, 200))
//        view.addSubview(l)
//        
//        l.startAnimating()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func rotateView(view: UIView, duration: Double = 1) {
        var rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Float(M_PI * 2.0)
        rotationAnimation.duration = duration
        rotationAnimation.repeatCount = 1
        
        view.layer.addAnimation(rotationAnimation, forKey: "")
        
    }


}

