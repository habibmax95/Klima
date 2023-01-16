//
//  WeatherResponse.swift
//  Klima
//
//  Created by Office on 1/15/23.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

struct Temperature: Codable {
    let temp: Float
    let feelsLike: Float
    let tempMin: Float
    let tempMax: Float
    
    private enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
struct WeatherResponse: Codable {
    let weather: [Weather]
    let temperature: Temperature
    let cityName: String
    private enum CodingKeys: String, CodingKey {
        case weather = "weather"
        case temperature = "main"
        case cityName = "name"
    }
}
