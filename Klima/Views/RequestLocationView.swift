//
//  RequestLocationView.swift
//  Klima
//
//  Created by Office on 1/16/23.
//

import SwiftUI

struct RequestLocationView: View {
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Show weather for my location")
                    .padding(.horizontal)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            
            Text("If you share your location the forecast is updated depending on where you are.\nSmooth!")
                .multilineTextAlignment(.center)
                .padding()
        } //: VStack
    }
}

struct RequestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLocationView()
    }
}
