//
//  MapViewController.swift
//  Weinsafari
//
//  Created by Tobias Steinbrück on 16.11.19.
//  Copyright © 2019 Tobias Steinbrück. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionInMeters = 2000.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        checkLocationServices()
        checkLocationAuthorization()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            
            showPOIsInMap(location)
            
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func showPOIsInMap(_ location:CLLocationCoordinate2D) {
        let point1 = MKPointAnnotation()
        point1.title = "Weinhof Zaiß"
        point1.subtitle = "Weinausschank & Schnitzel"
        point1.coordinate = CLLocationCoordinate2DMake(48.783930, 9.260940)
        mapView.addAnnotation(point1)
        
        let point2 = MKPointAnnotation()
        point2.title = "Weingut KD Warth"
        point2.subtitle = "Weinausschank & Grill, Wilde Kartoffel"
        point2.coordinate = CLLocationCoordinate2DMake(48.785445, 9.265824)
        mapView.addAnnotation(point2)
        
        let point3 = MKPointAnnotation()
        point3.title = "Currle Lodge"
        point3.subtitle = "Weinausschank & Flammkuchen"
        point3.coordinate = CLLocationCoordinate2DMake(48.782433, 9.264464)
        mapView.addAnnotation(point3)
        
        let point4 = MKPointAnnotation()
        point4.title = "MAXWEIN Camp"
        point4.subtitle = "Weinausschank & BBQ, Pulled Pork"
        point4.coordinate = CLLocationCoordinate2DMake(48.781127, 9.258815)
        mapView.addAnnotation(point4)
        
        let point5 = MKPointAnnotation()
        point5.title = "Weingut Schwarz"
        point5.subtitle = "Weinausschank & Gebackenes auf die Hand"
        point5.coordinate = CLLocationCoordinate2DMake(48.780916, 9.260507)
        mapView.addAnnotation(point5)
        
        let bus1 = MKPointAnnotation()
        bus1.title = "Bus 61"
        bus1.subtitle = "Untertürkheim Friedhof"
        bus1.coordinate = CLLocationCoordinate2DMake(48.785026, 9.260356)
        mapView.addAnnotation(bus1)
        
        let bus2 = MKPointAnnotation()
        bus2.title = "Bus 61"
        bus2.subtitle = "Aspen"
        bus2.coordinate = CLLocationCoordinate2DMake(48.786901, 9.267518)
        mapView.addAnnotation(bus2)
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            // setup location manager
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // TODO: Show alert to enable location service
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            mapView.showsUserLocation = true
            mapView.showsCompass = true
            mapView.pointOfInterestFilter = .some(MKPointOfInterestFilter())
            centerViewOnUserLocation()
            break
        case .denied:
            // TODO: Show alert
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // TODO: Show alert
            break
        @unknown default:
            // TODO: handle
            print("Error in checkLocationAuthorization")
        }
    }


}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        if (annotation.title!! == "Bus 61") {
            var anView = mapView.dequeueReusableAnnotationView(withIdentifier: "customImageView")
            if anView == nil {
                anView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
                anView!.canShowCallout = true
            }
            anView!.image = UIImage(named:"bus.png") // Bus stops should be displayed as a bus
            anView!.annotation = annotation

            return anView
        } else {
            var anView = mapView.dequeueReusableAnnotationView(withIdentifier: "defaultView")
            if anView == nil {
                anView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "defaultView")
            }
            anView?.displayPriority = .required // restaurants should be always shown
            
            return anView
        }
    }
}

