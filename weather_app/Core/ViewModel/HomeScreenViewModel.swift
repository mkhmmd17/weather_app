import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    
    let networkManager = NetworkManager()
    
    @Published var weatherData: [Forecast] = []
    @Published var days: Int = 0
    @Published var city: String = ""
    @Published var isLoading: Bool = false
    
    func getWeatherData() {
        async {
            isLoading = true
            do {
                let forecast = try await networkManager.getWeatherForecast(for: city, days: days)
                Task { @MainActor in
                    self.weatherData = forecast.forecast
                    isLoading = false
                }
            } catch {
                print(error)
            }
        }
    }
}
