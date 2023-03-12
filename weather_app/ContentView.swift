//
//  ContentView.swift
//  weather_app
//
//  Created by muslim on 10.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var VM: HomeScreenViewModel
    
    @State private var showingSheet: Bool = false
    
    var body: some View {
        VStack {
            
            TextField("Enter City", text: $VM.city)
                .padding()
                .background(Color.black.opacity(0.3).cornerRadius(10))
            TextField("Enter Days", value: $VM.days, formatter: NumberFormatter())
                .padding()
                .background(Color.black.opacity(0.3).cornerRadius(10))
                .keyboardType(.numberPad)
            
            Button("Display Weather") {
                VM.getWeatherData()
                showingSheet.toggle()
            }.sheet(isPresented: $showingSheet) {
                WeatherView()
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
