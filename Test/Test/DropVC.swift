//
//  DropVC.swift
//  Test
//
//  Created by Mollie on 2/27/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

class DropVC: UIViewController {

    @IBOutlet weak var marker1: UIImageView!
    @IBOutlet weak var marker2: UIImageView!
    @IBOutlet weak var marker3: UIImageView!
    @IBOutlet weak var marker4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        drop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drop() {
        
        
        UIView.animateWithDuration(3, animations: { () -> Void in
            
            self.marker1.hidden = false
            var frame = self.marker1.frame
            frame.origin.y = 600
            self.marker1.frame = frame
            
        })
        
        UIView.animateWithDuration(4, animations: { () -> Void in
            
            self.marker2.hidden = false
            var frame = self.marker2.frame
            frame.origin.y = 800
            self.marker2.frame = frame
            
        })
        
        UIView.animateWithDuration(5, animations: { () -> Void in
            
            self.marker3.hidden = false
            var frame = self.marker3.frame
            frame.origin.y = 1000
            self.marker3.frame = frame
            
        })
        
        // last one
        UIView.animateWithDuration(7, animations: { () -> Void in
            
            self.marker4.hidden = false
            var frame = self.marker4.frame
            frame.origin.y = 1400
            self.marker4.frame = frame
            
        })
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
