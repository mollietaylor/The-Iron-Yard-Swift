//
//  ViewController.swift
//  Directions
//
//  Created by Mollie on 3/17/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        
        myMapView.showsUserLocation = true
        
        let geoCoder = CLGeocoder()
        
        // destination
        geoCoder.geocodeAddressString("30303", completionHandler: { (placemarks, error) -> Void in
            
            if let placemark = placemarks.last as? MKPlacemark {
                
                let mapItem: MKMapItem = MKMapItem(placemark: placemark)
                
//                mapItem.openInMapsWithLaunchOptions(nil)
                
                let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeWalking]
                
                let currentMapItem: MKMapItem = MKMapItem.mapItemForCurrentLocation()
                
                MKMapItem.openMapsWithItems([currentMapItem, mapItem], launchOptions: options)
                
            }
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

