//
//  DashScreenView.swift
//  Klima
//
//  Created by Office on 1/16/23.
//

import SwiftUI
import CoreLocation

struct DashScreenView: View {
    @StateObject private var vm: DashScreenViewModel = DashScreenViewModel()
    var body: some View {
        return VStack {
            Spacer()
            switch vm.currentState {
            case .loading:
                Text("Loading...")
                    .padding(.bottom, 32)

            case .requestLocation:
                RequestLocationView()
                    .environmentObject(vm)
                    .padding(.bottom, 32)
            case .failed:
                Text("Failed")
                    .padding(.bottom, 32)
            case .weather:
                WeatherView(vm: WeatherViewModel(weatherData: vm.weatherData))
                    .padding(.bottom, 20)
            }
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
        )
        .ignoresSafeArea()
    }
}

//struct DashScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashScreenView()
//    }
//}
