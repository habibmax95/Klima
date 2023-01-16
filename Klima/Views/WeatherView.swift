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
        VStack (alignment: .leading) {
            HStack {
                Image("location")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(vm.cityName)
                    .font(.headline)
                
            } //: HStack
            
            HStack {
                HStack {
                    Image(vm.weatherIcon)
                        .resizable()
                        .frame(width: 56, height: 56)
                    Text(vm.currentTemperature)
                        .font(.system(size: 56, weight: .semibold))
                } //: HStack
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(vm.weatherStatus)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text(vm.temperatureRange)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text(vm.feelsLike)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                } //: VStack
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
