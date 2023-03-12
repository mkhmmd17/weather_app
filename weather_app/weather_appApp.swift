//
//  weather_appApp.swift
//  weather_app
//
//  Created by muslim on 10.03.2023.
//

import SwiftUI

@main
struct weather_appApp: App {
    
    @StateObject private var VM = HomeScreenViewModel()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(VM)
        }
    }
}
