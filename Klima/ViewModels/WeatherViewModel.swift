//
//  WeatherViewModel.swift
//  Klima
//
//  Created by Office on 1/16/23.
//

import Foundation

struct WeatherViewModel {
    
    let weatherData: WeatherResponse
    
    var cityName: String {
        weatherData.cityName
    }
    
    var weatherIcon: String {
        weatherData.weather[0].icon
    }
    
    var currentTemperature: String {
        "\(weatherData.temperature.temp.weatherReadingFormat)C"
    }
    
    var weatherStatus: String {
        weatherData.weather[0].main
    }
    
    var temperatureRange: String {
        "\(weatherData.temperature.tempMax.weatherReadingFormat)/\(weatherData.temperature.tempMin.weatherReadingFormat)"
    }
    
    var feelsLike: String {
        "Feels like \(weatherData.temperature.feelsLike.weatherReadingFormat)"
    }
}
