//
//  DashScreenViewModelTests.swift
//  KlimaTests
//
//  Created by Office on 1/16/23.
//

import XCTest
@testable import Klima
import CoreLocation

final class DashScreenViewModelTests: XCTestCase {
    var sut: DashScreenViewModel!
    
    func testSuccessViewStates() async {
        let endpoint = Endpoint.currentWeatherByLocation(lat: 59.329323, lon:18.068581)
        let mockUrlSession = getMockURLSession(dataString: locationResponseString , urlString: endpoint.path, statusCode: 200)
        let client = HTTPClient(urlSession: mockUrlSession)
        let mockLocationManager = MockLocationManager()
        sut = DashScreenViewModel(locationManager: mockLocationManager, client: client)
        
        XCTAssertEqual(sut.currentState, DashScreenState.loading)
        sut.locationManager.requestWhenInUseAuthorization()
        sut.onUpdateAuthorizationStatus()
        XCTAssertEqual(sut.locationManager.getAuthorizationStatus(), .authorizedWhenInUse)
        sut.locationManager.startUpdatingLocation()
        sut.onUpdateLocation()
        XCTAssertEqual(sut.currentState, DashScreenState.loading)
        _ = await sut.fetchWeatherByLocation(lat: 59.329323, lon:18.068581)
        XCTAssertNotNil(sut.weatherData)
        XCTAssertEqual(sut.currentState, .weather)
    }
    
    func testFailedAuthorizationStates() {
        let mockLocationManager = MockLocationManagerUnauthorized()
        sut = DashScreenViewModel(locationManager: mockLocationManager)
        
        XCTAssertEqual(sut.currentState, DashScreenState.loading)
        sut.locationManager.requestWhenInUseAuthorization()
        sut.onUpdateAuthorizationStatus()
        XCTAssertEqual(sut.locationManager.getAuthorizationStatus(), .denied)
        XCTAssertEqual(sut.currentState, DashScreenState.requestLocation)
    }
    
    func testNoLocationInfoStates() {
        let mockLocationManager = MockLocationManagerUnauthorized()
        sut = DashScreenViewModel(locationManager: mockLocationManager)
        
        XCTAssertEqual(sut.currentState, DashScreenState.loading)
        sut.onUpdateLocation()
        XCTAssertEqual(sut.currentState, DashScreenState.failed)
    }
    
    func testFailedResponseStates() async {
        let endpoint = Endpoint.currentWeatherByLocation(lat: 59.329323, lon:18.068581)
        let mockUrlSession = getMockURLSession(dataString: locationResponseString , urlString: endpoint.path, statusCode: 500)
        let client = HTTPClient(urlSession: mockUrlSession)
        let mockLocationManager = MockLocationManager()
        sut = DashScreenViewModel(locationManager: mockLocationManager, client: client)
        
        XCTAssertEqual(sut.currentState, DashScreenState.loading)
        sut.locationManager.requestWhenInUseAuthorization()
        sut.onUpdateAuthorizationStatus()
        XCTAssertEqual(sut.locationManager.getAuthorizationStatus(), .authorizedWhenInUse)
        sut.locationManager.startUpdatingLocation()
        sut.onUpdateLocation()
        XCTAssertEqual(sut.currentState, DashScreenState.loading)
        _ = await sut.fetchWeatherByLocation(lat: 59.329323, lon:18.068581)
        XCTAssertNil(sut.weatherData)
        XCTAssertEqual(sut.currentState, .failed)
    }
    
    func getMockURLSession(dataString: String, urlString: String, statusCode: Int) -> URLSession {
        let response = dataString
        let data = response.data(using: .utf8)!
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: URL(string: urlString)!, statusCode: statusCode, httpVersion: nil, headerFields: ["Content-Type": "application/json"])!
            return (response, data)
        }
        
        return MockURLSession.init().urlSession
    }

}
