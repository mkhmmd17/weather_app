//
//  WeatherRowView.swift
//  weather_app
//
//  Created by muslim on 11.03.2023.
//

import SwiftUI

struct WeatherRowView: View {
    
    let weather: WeatherForecast
    
    var body: some View {
        HStack() {
            Text(weather.location)
            Text(weather.region)
            Text(weather.country)
        }
        .font(.headline)
    }
}

struct WeatherRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherRowView(weather: WeatherForecast(location: "Chicago", region: "Downtown", country: "US"))
    }
}
