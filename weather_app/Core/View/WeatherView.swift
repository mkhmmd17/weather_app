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
        List {
            ForEach(VM.weatherData) { weatherData in
                WeatherRowView(weather: weatherData)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
