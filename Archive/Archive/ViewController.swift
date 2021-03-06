//
//  ViewController.swift
//  Archive
//
//  Created by Mollie on 2/26/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

private let documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)[0] as String

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(documentsDirectoryPath)
        
        loadDots()
        
        NSNotificationCenter.defaultCenter().addObserverForName("appIsClosing", object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            self.saveDots()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let dotsData = documentsDirectoryPath + "/dots2.data"
    
    func saveDots() {
        
        let boardView = self.view as BoardView
        // get the dots from boardview
        // archive dots to file
        
        NSKeyedArchiver.archiveRootObject(boardView.dots, toFile: dotsData)
        
    }
    
    func loadDots() {
        
        let boardView = self.view as BoardView
        // get file path for dots archive
        // unarchive file path to dots array
        // set boardview dots
        
        if let dots = NSKeyedUnarchiver.unarchiveObjectWithFile(dotsData) as? [Dot] {
            
            boardView.dots = dots
            boardView.setNeedsDisplay()
            
        }
        
    }


}

