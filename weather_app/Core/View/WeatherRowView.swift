//
//  WeatherRowView.swift
//  weather_app
//
//  Created by muslim on 11.03.2023.
//

import SwiftUI

struct WeatherRowView: View {
    
    let forecast: Forecast
    
    var body: some View {
        HStack() {
            Text(forecast.date)
            Text(forecast.date)
        }
        .font(.headline)
    }
}

struct WeatherRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherRowView(forecast: Forecast(date: "12.19.2000", maxTempC: 12.1, minTempC: 10.1))
    }
}
