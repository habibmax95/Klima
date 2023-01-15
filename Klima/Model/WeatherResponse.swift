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

struct WeatherResponse: Codable {
    let weather: [Weather]
    private enum CodingKeys: String, CodingKey {
        case weather = "weather"
    }
}
