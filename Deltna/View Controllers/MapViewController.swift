//
//  MapViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/28/22.
//

import UIKit
import GoogleMaps


class MapViewController: UIViewController, CLLocationManagerDelegate {

    
    let locationManager = CLLocationManager()
    
    
    @IBOutlet weak var myMap: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.requestLocation()
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var marker = GMSMarker()
        let newLocation = locations.last
        let lat = (newLocation?.coordinate.latitude)!
        let lng = (newLocation?.coordinate.longitude)!

        let position = GMSCameraPosition.camera(withTarget: newLocation!.coordinate,  zoom: 16)
        let centerr = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        marker = GMSMarker(position: centerr)
        //var camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 16)
        //self.myMap.camera = camera
        marker.map = self.myMap
        myMap.animate(to: position)
        
        
        
        
    
        myMap.camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0),
                                         zoom: 16,
                                         bearing: 0,
                                         viewingAngle: 0)

        _ = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)
        marker.title = "hi"
        marker.snippet = "I'm here"

        marker.map = myMap
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            return
        case .authorizedWhenInUse:
            return
        case .denied:
            print("alert massage .Enable the location from settings")
        case .restricted:
            locationManager.requestWhenInUseAuthorization()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()

        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error)
    }



    
    

}
