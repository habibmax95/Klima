//
//  WeatherView.swift
//  Klima
//
//  Created by Office on 1/16/23.
//

import SwiftUI

struct WeatherView: View {
    let vm: WeatherViewModel
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            // Weather Condition
            HStack {
                Image(vm.weatherIcon)
                    .resizable()
                    .frame(width: 28, height: 28)
                Text(vm.weatherStatus)
                    .font(.headline)
            }
            
            HStack (alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(vm.currentTemperature)
                        .font(.system(size: 56, weight: .semibold))
                    Text(vm.temperatureRange)
                        .font(.subheadline)
                    Text(vm.feelsLike)
                        .font(.subheadline)
                } //: VStack
                
                Spacer()
                
                // Location
                HStack {
                    Image("location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text(vm.cityName)
                        .font(.subheadline)
                    
                } //: HStack
                
            } //: HStack
        } //: VStack
        .padding()
        
    }
}

//struct WeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherView()
//    }
//}
