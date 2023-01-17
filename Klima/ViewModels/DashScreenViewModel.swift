//
//  DashScreenViewModel.swift
//  Klima
//
//  Created by Office on 1/16/23.
//

import Foundation
import CoreLocation
class DashScreenViewModel : NSObject, ObservableObject {
    @Published var currentState: DashScreenState = .loading
    public var locationManager: LocationManager
    private let client: HTTPClientImpl
    public var weatherData: WeatherResponse!
    
    init(locationManager: LocationManager = CLLocationManager(), client: HTTPClientImpl = HTTPClient()) {
        self.locationManager = locationManager
        self.client = client
        super.init()
        self.locationManager.delegate = self
    }
    
    @MainActor
    func fetchWeatherByLocation(lat: Double, lon: Double) async {
        currentState = .loading
        do {
            let url = Endpoint.currentWeatherByLocation(lat: lat, lon: lon).url
            let response = try await client.request(url: url, type: WeatherResponse.self)
            self.weatherData = response
            self.currentState = .weather
        } catch {
            self.currentState = .failed
        }
    }
    
    func onTapEnableLocation() {
        if locationManager.getAuthorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else {
            Utilities.openSettingsSreen()
        }
    }
    
    func onUpdateAuthorizationStatus() {
        switch locationManager.getAuthorizationStatus() {
            case .notDetermined:
                currentState = .requestLocation
            case .restricted, .denied:
                currentState = .requestLocation
            case .authorizedAlways, .authorizedWhenInUse:
                currentState = .loading
                locationManager.startUpdatingLocation()
            @unknown default:
                currentState = .failed
        }
    }
    
    func onUpdateLocation() {
        guard let location = locationManager.location else {
            currentState = .failed
            return
        }
        Task {
            await fetchWeatherByLocation(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }
    
}

extension DashScreenViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        onUpdateAuthorizationStatus()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        onUpdateLocation()
    }
}
