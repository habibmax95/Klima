//
//  HTTPClientTests.swift
//  KlimaTests
//
//  Created by Office on 1/15/23.
//

import XCTest
@testable import Klima


final class HTTPClientTests: XCTestCase {
    
    let endpoint = Endpoint.currentWeatherByLocation(lat: 59.329323, lon:18.068581)
    
    func test_shouldThrowBadURL() async throws {
        
        let client = HTTPClient()
        let wrongUrl = URL(string: "")
        
        do {
            _ = try await client.request(url: wrongUrl, type: WeatherResponse.self)
            XCTFail("This call should throw bad url error.")
        } catch let error {
            XCTAssertTrue(error is NetworkError)
            let error = error as? NetworkError
            XCTAssertEqual(error?.errorDescription, NetworkError.badUrl.errorDescription)
        }
        
    }
    
    func test_shouldThrowInvalidStatusCodeError() async throws {
        let mockUrlSession = getMockURLSession(dataString: locationResponseString , urlString: endpoint.path, statusCode: 500)
        let client = HTTPClient(urlSession: mockUrlSession)
        
        do {
            _ = try await client.request(url: endpoint.url, type: WeatherResponse.self)
            XCTFail("This call should throw invalid status code error.")
        } catch let error {
            XCTAssertTrue(error is NetworkError)
            let error = error as? NetworkError
            XCTAssertEqual(error?.errorDescription, NetworkError.invalidStatusCode(statusCode: 500).errorDescription)
        }
    }
    
    func test_shouldThrowDecodingError() async throws {
        let mockUrlSession = getMockURLSession(dataString: "{data = invalid}" , urlString: endpoint.path, statusCode: 200)
        let client = HTTPClient(urlSession: mockUrlSession)
        
        do {
            _ = try await client.request(url: endpoint.url, type: WeatherResponse.self)
            XCTFail("This call should throw decodning error.")
        } catch let error {
            XCTAssertTrue(error is NetworkError)
            let error = error as? NetworkError
            XCTAssertEqual(error?.errorDescription, NetworkError.decodingError.errorDescription)
        }
    }
    
    func test_ResponseDataisCorrect() async throws {
        let mockUrlSession = getMockURLSession(dataString: locationResponseString , urlString: endpoint.path, statusCode: 200)
        let client = HTTPClient(urlSession: mockUrlSession)
        let weatherResponse = try await client.request(url: endpoint.url, type: WeatherResponse.self)
        XCTAssertNotNil(weatherResponse)
        XCTAssertEqual(weatherResponse.weather[0].id, 501)
        XCTAssertEqual(weatherResponse.weather[0].main, "Rain")
        XCTAssertEqual(weatherResponse.weather[0].description, "moderate rain")
        XCTAssertEqual(weatherResponse.weather[0].icon, "10n")
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
