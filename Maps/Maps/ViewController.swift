//
//  ViewController.swift
//  Maps
//
//  Created by Mollie on 2/2/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var onceToken: dispatch_once_t = 0

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var mapView = MKMapView()
    
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.frame = view.frame
        
        view.addSubview(mapView)
        
        mapView.delegate = self
        
        manager.delegate = self
        manager.distanceFilter = kCLDistanceFilterNone
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView        
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinColor = .Purple
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation = locations.last as CLLocation
        
        mapView.showsUserLocation = true
        
        // or you could put all this stuff inside dispatch_once
        let venues = FourSquareRequest.requestVenuesWithLocation(userLocation)
        
        createAnnotationsWithVenues(venues)
        
        // zoom to annotations
        mapView.showAnnotations(mapView.annotations, animated: true)
        
//        dispatch_once(&onceToken) { () -> Void in
//            
//            println(locations)
//            
//            if let location = locations.last as? CLLocation {
//                
//            }
//            
//        }
        
        manager.stopUpdatingLocation()
        
    }
    
    func createAnnotationsWithVenues(venues: [AnyObject]) {
        
        for venue in venues as [[String:AnyObject]] {
            
            let locationInfo = venue["location"] as [String:AnyObject]
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(locationInfo["lat"] as Double, locationInfo["lng"] as Double)
            annotation.title = venue["name"] as String
            mapView.addAnnotation(annotation)
            
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

