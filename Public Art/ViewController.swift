//
//  ViewController.swift
//  Public Art
//
//  Created by Tom Kearsley on 8/11/16.
//  Copyright © 2016 Tom Kearsley. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var MapView: MKMapView!
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let location = locations[0]
        
        
        //let span:MKCoordinateSpan = MKCoordinateSpanMake(0.02, 0.02)
        
        //let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tracking user's location
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        // Setting up Map
        let distanceSpan:CLLocationDegrees = 2000
        MapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(-39.0556253, 174.0752278), distanceSpan, distanceSpan), animated: true)
        MapView.showsUserLocation = true
        MapView.delegate = self
        
        // artwork on map
        let windwandcoord: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-39.055961,174.072288)
        let artworkPin = Artwork(title:"Wind Wand",locationName:"Majestic",discipline:"Statue",
                                 coordinate:windwandcoord)
        MapView.addAnnotation(artworkPin)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if annotation is MKUserLocation {return nil}
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.calloutOffset = CGPoint(x: -5, y: 5)
            let calloutButton = UIButton(type: .detailDisclosure)
            pinView!.rightCalloutAccessoryView = calloutButton
            pinView!.sizeToFit()
        }
        else {
            pinView!.annotation = annotation
        }
        
        
        return pinView
    }
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "no", sender:self)
        }
    }
    
    
}








