//
//  FirstViewController.swift
//  D05
//
//  Created by Arthur DUBEDAT on 4/2/18.
//  Copyright © 2018 Arthur DUBEDAT. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        mapView.delegate = self
        setupPins()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func setupPins() {
        for elem in Places.list {
            let pin = MapPin(coordinate: elem.2, title: elem.0, subtitle: elem.1, type: elem.3)
            mapView.addAnnotation(pin)
        }

        mapView.setRegion(MKCoordinateRegionMakeWithDistance(Places.list[0].2, 1000, 1000), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation is MKUserLocation) {
            return nil
        }

        let reuseIdentifier = "reuseIdentifier"
        let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let pin = annotation as! MapPin
        
        pinView.canShowCallout = true
        
        switch pin.type! {
        case .building:
            pinView.pinTintColor = UIColor.blue
        case .city:
            pinView.pinTintColor = UIColor.red
        case .country:
            pinView.pinTintColor = UIColor.yellow
        }
        return pinView
    }
    
    @IBAction func centerUserLocation(_ sender: Any) {
        if let userLocation = locationManager.location?.coordinate {
            mapView.setRegion(MKCoordinateRegionMakeWithDistance(userLocation, 1000, 1000), animated: true)
        }
    }
    
    @IBAction func segControlSelect(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }
}
