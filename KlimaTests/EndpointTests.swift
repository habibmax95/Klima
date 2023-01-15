//
//  EndpointTests.swift
//  KlimaTests
//
//  Created by Office on 1/15/23.
//

import XCTest
@testable import Klima
final class EndpointTests: XCTestCase {

    func testCurrentWeatherByLocationEndpointIsValid() {
        let endpoint = Endpoint.currentWeather(lat: 59.329323, lon:18.068581)
        XCTAssertEqual(endpoint.url?.absoluteString, "https://api.openweathermap.org/data/2.5/weather?appid=f1e1e54bd180683469368ad612c7f945&units=metric&lat=59.329323&lon=18.068581", "The endpoint is invalid")
    }

}
