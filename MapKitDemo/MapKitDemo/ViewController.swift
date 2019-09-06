//
//  ViewController.swift
//  MapKitDemo
//
//  Created by trainee on 28/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
   
    var locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
       determineCurrentLocation()
}
 
    func determineCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
   
//    func showMap(_ lat: Double, _ long: Double){
//        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
//        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
//        let region = MKCoordinateRegion(center: location, span: span)
//        mapView.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//
//        annotation.coordinate = location
//        annotation.title = "Eagle Motel"
//
//        mapView.addAnnotation(annotation)
//    }
  
}
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        //manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
        myAnnotation.title = "Rajpura"
        mapView.addAnnotation(myAnnotation)
        
        
      //  showMap(locValue.latitude, locValue.longitude)
        

    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
          print("Error \(error)")
    }
    
}
extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }

        else{
           let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKPinAnnotationView()
       // annotationView?.image = UIImage(named: "king")
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView.canShowCallout = true
            return annotationView
        }
    
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let annView = view.annotation
        let detailVc = self.storyboard?.instantiateViewController(withIdentifier: "CalloutViewController") as! CalloutViewController
        detailVc.titleStr = ((annView?.title!)!)
        self.navigationController?.pushViewController(detailVc, animated: true)
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        if let annotationTitle = view.annotation?.title
        {
            print("User tapped on annotation with title: \(annotationTitle!)")
        }
    }
//
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let renderer = MKCircleRenderer(overlay: overlay)
//        renderer.fillColor = UIColor.lightGray.withAlphaComponent(0.5)
//        renderer.strokeColor = UIColor.red
//        renderer.lineWidth = 2
//        return renderer
//    }
}

