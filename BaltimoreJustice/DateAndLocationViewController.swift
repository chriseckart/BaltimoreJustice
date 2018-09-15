//
//  DateAndLocationViewController.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 12/21/16.
//  Copyright © 2016 Christopher Eckart. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DateAndLocationViewController: UIViewController, MKMapViewDelegate, UIGestureRecognizerDelegate, CLLocationManagerDelegate {
    
    var INCIDENTDATE = Date()
    // MARK: UPDATE, should INCIDENTLOCATION = "(0,0) Address"
    var INCIDENTLOCATION = ""
    var newPin = SafeLocation(title: "Marked Incident Location", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), tag:"IncidentLocation")

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    

    // MARK: Global Declarations
    let BaltimoreLocation = CLLocationCoordinate2DMake(39.2904,-76.6122)
    let policeStations = SafeLocationList().police
    let fireStations = SafeLocationList().fire
    let hospitalStations = SafeLocationList().hospital

    
    // MARK: Map Setup
    func resetRegion(){
        let region = MKCoordinateRegionMakeWithDistance(BaltimoreLocation, 10000, 10000)
        MapView.setRegion(region, animated: true)
    }
    
    // MARK: Annotations
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // screen background color
        //self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        MapView.delegate = self
        MapView.showsUserLocation = true
        
        resetRegion()
        MapView.addAnnotations(policeStations)
        MapView.addAnnotations(fireStations)
        MapView.addAnnotations(hospitalStations)
        
        // ask to use privacy location services
        locationManager.requestWhenInUseAuthorization()
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(self.addAnnotationFromLongPress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 0.8
        MapView.addGestureRecognizer(uilpgr)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("the value of INCIDENTDATE is" , INCIDENTDATE)
        print("the value of INCIDENTLOCATION is", INCIDENTLOCATION)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Map View
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MKUserLocation {
            //MARK: UPDATE, the annotation should not show pop up
        }
        
        if let annotation = annotation as? SafeLocation {
            let reuseid = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseid)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseid)
                view.animatesDrop = true
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type:.detailDisclosure) as UIView
            }
            switch annotation.tag{
                case "police": view.pinTintColor = .blue
                case "fire": view.pinTintColor = .red
                case "hospital": view.pinTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                case "IncidentLocation": view.pinTintColor = .black
                default: view.pinTintColor = .yellow
            }
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("accessory pressed")
    }
    
    // MARK: Actions
    @IBAction func cancelReport(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func addAnnotationFromLongPress(gestureRecognizer:UIGestureRecognizer){
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            let touchPoint = gestureRecognizer.location(in: MapView)
            let newCoordinates = MapView.convert(touchPoint, toCoordinateFrom: MapView)
            let usableCoordinates = CLLocation(latitude: newCoordinates.latitude, longitude: newCoordinates.longitude)
            
            INCIDENTLOCATION = "\(newCoordinates.latitude), " + "\(newCoordinates.longitude)"
            defaults.set(INCIDENTLOCATION, forKey: "FINALLOCATION")
            
            newPin.coordinate = newCoordinates
            // new pin subtitle is changed in reverse geocoding func
            newPin.subtitle = ""
    
            print("pinned coordinates are", newPin.coordinate)
            
            // MARK: UPDATE, add reverse geocoding to get approx. address for database, and to display to user as subtitle of annotation (using CLLocationManager)
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            //locationManager.startUpdatingLocation()
            
            CLGeocoder().reverseGeocodeLocation(usableCoordinates) { (placemark,error) in
                if error != nil {
                    print("Reverse geocoder failed with error")
                } else {
                    if let place = placemark?[0]{
                        if place.subThoroughfare != nil{
                            self.reverseGeoCode(placemark: place)
                        }
                    }
                }
            }
            
            MapView.removeAnnotation(newPin)
            MapView.addAnnotation(newPin)
            
        }
    }
    
    // MARK: CLLocationManager (but we are using it in the addannotationfromlongpress function ,so this might be deprecated later) except it is still needed for userlocation i guess? not sure because the user would just press on themself
    func reverseGeoCode(placemark:CLPlacemark){
// if placemark.tag = "userlocation"{
// locationManager.stopUpdatingLocation()
// } else if placemark is {
        newPin.subtitle = placemark.subThoroughfare! + " " + placemark.thoroughfare! + ", " + placemark.locality! + ", " + placemark.administrativeArea! + ", " + placemark.postalCode!
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating location ", error.localizedDescription)
    }
    
    
    // MARK: UIDatePicker
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        INCIDENTDATE = DatePicker.date
        print("the value of INCIDENTDATE is" , INCIDENTDATE)
        defaults.set(INCIDENTDATE, forKey: "FINALDATE")
    }
    
    
}
