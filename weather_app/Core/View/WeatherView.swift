//
//  WeatherView.swift
//  weather_app
//
//  Created by muslim on 11.03.2023.
//

import SwiftUI

struct WeatherView: View {
    
    @EnvironmentObject var VM: HomeScreenViewModel
    
    var body: some View {
        if VM.isLoading {
            ProgressView()
                .progressViewStyle(.circular)
        } else {
            List {
                ForEach(VM.weatherData, id: \.id) { weatherData in
                    WeatherRowView(forecast: weatherData)
                }
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
