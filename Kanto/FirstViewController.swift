//
//  FirstViewController.swift
//  Kanto
//
//  Created by Mbongeni NDLOVU on 2018/10/08.
//  Copyright © 2018 mndlovu. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupLocationPin(rangeSpan: 10000)
    }

    
    func setupLocationPin(rangeSpan: CLLocationDistance) {
        for point in PinCoordinates.point {
            let region = MKCoordinateRegionMakeWithDistance(point.coordinate!, rangeSpan, rangeSpan)
            let pin = MyAnnotation(coordinate: point.coordinate!, title: point.name, subtitle: point.subTitle)
            mapView.addAnnotation(pin)
            mapView.region = region
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
            if PinCoordinates.isSelected {
                let index = PinCoordinates.selected
                let region = MKCoordinateRegionMakeWithDistance(PinCoordinates.point[index].coordinate!, 100, 100)
                let pin = MyAnnotation(coordinate: PinCoordinates.point[index].coordinate!, title: PinCoordinates.point[index].name, subtitle: PinCoordinates.point[index].subTitle)
                mapView.addAnnotation(pin)
                mapView.region = region
            }
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = MKMapType.satellite
        case 2:
            mapView.mapType = MKMapType.hybrid
        default:
            mapView.mapType = MKMapType.standard
        }
    }
    
    
    @IBAction func getCurrentLocation(_ sender: UIButton) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    // MKMapViewDelegate
    internal func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "pin")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        manager.stopUpdatingLocation()
    }
}





