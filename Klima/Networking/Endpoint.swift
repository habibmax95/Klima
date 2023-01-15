//
//  Endpoint.swift
//  Klima
//
//  Created by Office on 1/15/23.
//

import Foundation

enum Endpoint {
    private enum Constants {
        static let baseURL: String = "https://api.openweathermap.org/data/2.5"
        static let appId: String = "f1e1e54bd180683469368ad612c7f945"
    }
    case currentWeather(lat: Double, lon: Double)
    
    var path: String {
        switch self {
        case .currentWeather(let lat, let lon):
            return "\(Constants.baseURL)/weather?appid=\(Constants.appId)&units=metric&lat=\(lat)&lon=\(lon)"
            
        }
    }
    
    var url: URL? {
        URL(string: path)
        
    }
}
