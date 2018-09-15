//
//  SafeLocations.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 12/21/16.
//  Copyright © 2016 Christopher Eckart. All rights reserved.
//

import UIKit
import MapKit

class SafeLocation: NSObject, MKAnnotation{
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var tag: String
    
    // pinColor for different 'tags' or types of safe locations: police, fire, hospital

    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, tag: String) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.tag = tag
    }
    
}



class SafeLocationList: NSObject {
    var police = [SafeLocation]()
    var fire = [SafeLocation]()
    var hospital = [SafeLocation]()

    override init(){
        //police stations
        police += [SafeLocation(title:"Baltimore City Sheriff's Office", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 39.2908160, longitude: -76.6132340), tag:"police")]
        police += [SafeLocation(title:"Baltimore City Police Headquarters", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 39.2902200, longitude: -76.6076880), tag:"police")]
        police += [SafeLocation(title:"Baltimore Police Department - Central District", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 39.2899801, longitude: -76.6083632), tag:"police")]

        //fire stations
        fire += [SafeLocation(title:"Baltimore City Fire Department", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 39.2902827, longitude: -76.6099394), tag:"fire")]
        fire += [SafeLocation(title:"Baltimore Fire Station", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 39.3504080, longitude: -76.6359060), tag:"fire")]
        fire += [SafeLocation(title:"Baltimore County Fire Station 3", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 39.3374180, longitude: -76.7550810), tag:"fire")]

        //hospital locations
        hospital += [SafeLocation(title:"The Johns Hopkins Hospital", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 39.2962572, longitude: -76.5917676), tag:"hospital")]
        hospital += [SafeLocation(title:"Mercy Medical Center", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 39.2942363, longitude: -76.6129100), tag:"hospital")]
        hospital += [SafeLocation(title:"MedStar Harbor Hospital", subtitle: "", coordinate: CLLocationCoordinate2D(latitude: 39.2520603, longitude: 	-76.6139070), tag:"hospital")]

    }
}
