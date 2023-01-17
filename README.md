# Klima
Weather app | MVVM | SwiftUI | Unit Tests

# Project description
iOS Weather app built using OpenWeather API to display the current weather based on user location. The default unit of measurement used is metric.


# Technical information :
Development Language Used : Swift 5
Current Version : 1.0
Build : 1
Deployment target : iOS 16.2
XcodeVersion : 14.2
Supported Devices : iPhone , iPad
Third Party Software : OpenWeather API

# Steps to run project :
1. Download or clone the proejct from github URL
2. Open Klima.xcodeproj
3. Build and Run the project

# App Usage :
On Launching the app for first time, user will be promoted to enable location service. Once the location is enabled, it will fetch and show weather data. If it fails throughout the process, the app will show fail message.

# iOS Development Technologies and Concepts used :
MVVM Architecture
Depenedency Injection
Protocol Oriented Programming
Network calls using URLSession
SwiftUI
TDD
Unit tests using XCTest
Extensions

# Project Structure :
Extensions : Contain the extensions of Float
Utilties : Contains utiity functions
Usecases : Contains the manager classes for location
Networking : Contains networking related usecases
ViewModel : Contains the view model of the corresponding views
Model : Contains the strcuture of the response json
Screens : Contains app screens view 
Views : Contains the custom views
KlimaTests : Contains the Unit tests to be run on the app


# Scope of Improvement :

1. Cache and display last update weather information in case of network unavailablity
2. Display hourly and daily weather forecase
3. Take city name as input
4. Add UI tests
5. Provide option to choose the unit of measurement

# Requirements
1. Show weather data based on location
2. Take city name as input to fetch its weather

# Wireframe
![Alt text](/Screenshots/Wireframes/wireframe_klima.png?raw=true "Wireframe")

# Screenshots
![Alt text](/Screenshots/App/klima_weather.png?raw=true "Weather UI") ![Alt text](/Screenshots/App/kilma_permission.png?raw=true "Permission UI")

