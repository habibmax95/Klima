//
//  MockLocationManager.swift
//  KlimaTests
//
//  Created by Office on 1/17/23.
//

import Foundation
@testable import Klima
import CoreLocation

class MockLocationManager: LocationManager {
    var location: CLLocation? = CLLocation(
        latitude: 59.329323,
        longitude: 18.068581
    )
    
    var delegate: CLLocationManagerDelegate?
    
    var distanceFilter: CLLocationDistance = 10
    
    var pausesLocationUpdatesAutomatically: Bool = false
    
    var allowsBackgroundLocationUpdates: Bool = true
    
    func requestWhenInUseAuthorization() {
    }
    
    func startUpdatingLocation() {
        
    }
    
    func stopUpdatingLocation() {
        // empty body
    }
    
    func getAuthorizationStatus() -> CLAuthorizationStatus {
        return .authorizedWhenInUse
    }
    
    func isLocationServicesEnabled() -> Bool {
        return true
    }
    
}

class MockLocationManagerUnauthorized: LocationManager {
    var location: CLLocation?
    
    var delegate: CLLocationManagerDelegate?
    
    var distanceFilter: CLLocationDistance = 10
    
    var pausesLocationUpdatesAutomatically: Bool = false
    
    var allowsBackgroundLocationUpdates: Bool = true
    
    func requestWhenInUseAuthorization() {
    }
    
    func startUpdatingLocation() {
        
    }
    
    func stopUpdatingLocation() {
        // empty body
    }
    
    func getAuthorizationStatus() -> CLAuthorizationStatus {
        return .denied
    }
    
    func isLocationServicesEnabled() -> Bool {
        return true
    }
    
}
