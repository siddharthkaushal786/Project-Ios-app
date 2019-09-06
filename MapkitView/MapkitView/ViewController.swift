//
//  ViewController.swift
//  MapkitView
//
//  Created by trainee on 27/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
  
    @IBOutlet weak var mapView: MKMapView!
     let locationManager = CLLocationManager()
     let places = Place.getPlaces()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        //checkLocationServices()
       checkLocationAuthorization()
         addAnnotations()
    }
//    func checkLocationServices() {
//        if CLLocationManager.locationServicesEnabled() {
//            checkLocationAuthorization()
//        } else {
//            // Show alert letting the user know they have to turn this on.
//        }
//    }
    func checkLocationAuthorization() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .denied: // Show alert telling users how to turn on permissions
            print("location access denied")
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
        case .restricted: // Show an alert letting them know what’s up
            print("location access denied")
            break
        case .authorizedAlways:
            break
        default:
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.desiredAccuracy = 1.0
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func addAnnotations() {
        mapView?.delegate = self
        mapView?.addAnnotations(places)
        let overlays = places.map { MKCircle(center: $0.coordinate, radius: 100) }
        mapView?.addOverlays(overlays)
    }
   
}
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        self.mapView.setRegion(region, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }

        else {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKPinAnnotationView()
            annotationView.image = UIImage(named: "king")
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView.canShowCallout = true
            return annotationView

        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKCircleRenderer(overlay: overlay)
        renderer.fillColor = UIColor.lightGray.withAlphaComponent(0.5)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 2
        return renderer
    }
}
}
