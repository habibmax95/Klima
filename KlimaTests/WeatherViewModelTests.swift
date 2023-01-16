//
//  WeatherViewModelTests.swift
//  KlimaTests
//
//  Created by Office on 1/16/23.
//

import XCTest
@testable import Klima

final class WeatherViewModelTests: XCTestCase {
    
    var sut: WeatherViewModel!
    
    override func setUpWithError() throws {
        let data = locationResponseString.data(using: .utf8)!
        let weatherData = try! JSONMapper.decode(data: data, type: WeatherResponse.self)
        sut = WeatherViewModel(weatherData: weatherData)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testAttributesAreEqual() {
        XCTAssertEqual(sut.cityName, "Stockholm")
        XCTAssertEqual(sut.weatherData.weather.count, 1)
        XCTAssertEqual(sut.weatherIcon, "10n")
        XCTAssertEqual(sut.currentTemperature, "3.53°C")
        XCTAssertEqual(sut.weatherStatus, "Rain")
        XCTAssertEqual(sut.temperatureRange, "3.92°C/3.05°C")
        XCTAssertEqual(sut.feelsLike, "Feels like -2.14°C")
    }
    
}
