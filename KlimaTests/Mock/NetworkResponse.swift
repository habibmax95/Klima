//
//  URLResponse.swift
//  KlimaTests
//
//  Created by Office on 1/15/23.
//

import Foundation

let locationResponseString = """
{
  "coord": {
    "lon": 18.0664,
    "lat": 59.3279
  },
  "weather": [
    {
      "id": 501,
      "main": "Rain",
      "description": "moderate rain",
      "icon": "10n"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 3.53,
    "feels_like": -2.14,
    "temp_min": 3.05,
    "temp_max": 3.92,
    "pressure": 985,
    "humidity": 93
  },
  "visibility": 8000,
  "wind": {
    "speed": 9.26,
    "deg": 140
  },
  "rain": {
    "1h": 0.87
  },
  "clouds": {
    "all": 100
  },
  "dt": 1673750544,
  "sys": {
    "type": 1,
    "id": 1788,
    "country": "SE",
    "sunrise": 1673767856,
    "sunset": 1673792556
  },
  "timezone": 3600,
  "id": 2673730,
  "name": "Stockholm",
  "cod": 200
}
"""


