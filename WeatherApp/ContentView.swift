//
//  ContentView.swift
//  WeatherApp
//
//  Created by Piotr Kowalski on 11/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: "sun.max.fill")
                    .font(.largeTitle)
                Text("24º")
                    .font(.largeTitle)
            }
            Text("Sunny outside.\nDon't forget your hat!xxxx")
                .font(.body)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
