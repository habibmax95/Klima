//
//  WeatherNumberFormatterTests.swift
//  KlimaTests
//
//  Created by Office on 1/17/23.
//

import Foundation
import XCTest
@testable import Klima

class WeatherReadingFormatterTests: XCTestCase {
  
  func testWeatherReadingFormatterWholeNumber() {
      XCTAssertEqual(Float(0).weatherReadingFormat, "0.0°")
    XCTAssertEqual(Float(1).weatherReadingFormat, "1.0°")
    XCTAssertEqual(Float(2).weatherReadingFormat, "2.0°")
    XCTAssertEqual(Float(123).weatherReadingFormat, "123.0°")
    XCTAssertEqual(Float(-2).weatherReadingFormat, "-2.0°")
  }
  
  func testMoneyFormatterDecimalNumberWithOneDecimalPlace() {
      XCTAssertEqual(Float(1.1).weatherReadingFormat, "1.1°")
      XCTAssertEqual(Float(1.2).weatherReadingFormat, "1.2°")
      XCTAssertEqual(Float(-1.2).weatherReadingFormat, "-1.2°")
  }
  
  
  func testMoneyFormatterDecimalNumberWithAnyDecimalPlaces() {
    XCTAssertEqual(Float(1.111).weatherReadingFormat, "1.1°")
    XCTAssertEqual(Float(1.1333).weatherReadingFormat, "1.1°")
    XCTAssertEqual(Float(1.234567).weatherReadingFormat, "1.2°")
    XCTAssertEqual(Float(-1.234567).weatherReadingFormat, "-1.2°")
  }
  
}
