//
//  ContentView.swift
//  WeatherApp
//
//  Created by Piotr Kowalski on 11/04/2023.
//

import SwiftUI
import SwiftUI

struct ContentView: View {
    @StateObject private var weatherAPIClient = WeatherAPIClient()
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            if let currentWeather = weatherAPIClient.currentWeather  {
                HStack(alignment: .center, spacing: 16) {
                    currentWeather.weatherCode.image
                        .font(.largeTitle)
                    Text("\(currentWeather.temperature)º")
                        .font(.largeTitle)
                }
                Text(currentWeather.weatherCode.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
            } else {
                Text("No weather info available yet.\nTap on refresh to fetch new data.\nMake sure you have enabled location permissions for the app.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                Button("Refresh", action: {
                    Task {
                        await weatherAPIClient.fetchWeather()
                    }
                })
            }
            Spacer()
        }
        .onAppear {
            Task {
                await weatherAPIClient.fetchWeather()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//https://api.tomorrow.io/v4/timelines?location=40.7579787,-73.9877313&fields=temperature&fields=weatherCode&units=metric&timesteps=1h&startTime=2023-04-11T14:00:11Z&endTime=2023-04-11T15:00:11Z&apikey=iwHcW25MqohoMT9jLMB8T9ZAxBD9HX45
