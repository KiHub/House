//
//  LocationManager.swift
//  House
//
//  Created by  Mr.Ki on 14.12.2022.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    //MARK: - User location
    private let locationManager = CLLocationManager()
    //    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    
        override init() {
            super.init()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            // Start update location
            locationManager.startUpdatingLocation()
        }
//    func startUpdateLocation() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        // Start update location
//        locationManager.startUpdatingLocation()
//    }
//
//    func stopUpdateLocation() {
//        //MARK: - Check
//        lastLocation = locationManager.location
//        locationManager.delegate = nil
//        locationManager.stopUpdatingLocation()
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        
        
        
    }
}
