//
//  WeatherView.swift
//  Klima
//
//  Created by Office on 1/16/23.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image("location")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text("Solna, Stockholm")
                    .font(.headline)
                
            } //: HStack
            
            HStack {
                HStack {
                    Image("10d")
                        .resizable()
                        .frame(width: 56, height: 56)
                    Text("4°")
                        .font(.system(size: 56, weight: .semibold))
                } //: HStack
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Rain")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text("5°/3°")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text("Feels like 0°")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                } //: VStack
            } //: HStack
        } //: VStack
        .padding()
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
