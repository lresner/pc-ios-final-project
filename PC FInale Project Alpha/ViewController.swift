//
//  ViewController.swift
//  PC FInale Project Alpha
//
//  Created by Joe Burgess on 9/22/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
//        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) { locationManager.requestWhenInUseAuthorization() }
//        
//        locationManager.startUpdatingLocation()
//        
        
        self.locationManager.requestWhenInUseAuthorization()
       self.locationManager.startUpdatingLocation()
        
        
        //Initializze NSData object that is initialized with the contents of the filepath
//        var filePath = NSBundle.mainBundle().pathForResource("rows", ofType: "json")
//        var data =  NSData(contentsOfFile: filePath!)
//        //print(data)
//        
//        let json = JSON(data: data!)
//        var actualData = json["data"]
        //var dataDictionary = json.dictionary
//        var dataPointOne = actualData[0]
//        var lat:Double = actualData[0][14].doubleValue
//        let latitude:CLLocationDegrees = lat
//        var long:Double = actualData[0][15].doubleValue
//        let longitude:CLLocationDegrees = long
//        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
//        let span = MKCoordinateSpanMake(0.01,0.01)
//        let region = MKCoordinateRegionMake(coordinate,span)
//        map.setRegion(region, animated: true)
//        var annotation = MKPointAnnotation()
//        annotation.coordinate = coordinate
//        map.addAnnotation(annotation)
//        
//        for dataPoint in 0...actualData.count {
//            
//            var dataPointOne = actualData[dataPoint]
//            var lat:Double = actualData[dataPoint][14].doubleValue
//            let latitude:CLLocationDegrees = lat
//            var long:Double = actualData[dataPoint][15].doubleValue
//            let longitude:CLLocationDegrees = long
//            let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
//            let span = MKCoordinateSpanMake(0.1,0.1)
//            let region = MKCoordinateRegionMake(coordinate,span)
//            map.setRegion(region, animated: true)
//            var annotation = MKPointAnnotation()
//            annotation.coordinate = coordinate
//            map.addAnnotation(annotation)
//            
//            
//        }
        
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        var filePath = NSBundle.mainBundle().pathForResource("rows", ofType: "json")
        var data =  NSData(contentsOfFile: filePath!)
        //print(data)
        
        let json = JSON(data: data!)
        var actualData = json["data"]
        
        var userLocation:CLLocation = locations[0] as! CLLocation
        var userLatitude = userLocation.coordinate.latitude
        var userLongitude = userLocation.coordinate.longitude
        self.locationManager.stopUpdatingLocation()
        
        for dataPoint in 0...actualData.count {
            
            var dataPointOne = actualData[dataPoint]
            var lat:Double = actualData[dataPoint][14].doubleValue
            let latitude:CLLocationDegrees = lat
            var long:Double = actualData[dataPoint][15].doubleValue
            let longitude:CLLocationDegrees = long
            
            if abs(userLongitude-longitude) <= 0.05 && abs(userLatitude-latitude) <= 0.05{
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
                let span = MKCoordinateSpanMake(0.1,0.1)
                let region = MKCoordinateRegionMake(coordinate,span)
                map.setRegion(region, animated: true)
                var annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                map.addAnnotation(annotation)
            }
            
            
        }
        
      
        
        //if abs(userLatitude-latitude) < span print
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
 


}

