//
//  ViewController.swift
//  Money
//
//  Created by Mollie on 3/4/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import iAd

func adBanner() -> ADBannerView {
    
    var adBanner = ADBannerView(adType: ADAdType.Banner)
    
    adBanner.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 66)
    
    return adBanner
    
}

class ViewController: UIViewController {

    @IBOutlet weak var adBanner: ADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(adBanner())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

