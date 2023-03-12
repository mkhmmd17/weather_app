import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    
    let networkManager = NetworkManager()
    
    @Published var weatherData: [Forecast] = []
    @Published var days: Int = 0
    @Published var city: String = ""
    @Published var isLoading: Bool = false
    
    func getWeatherData() {
        isLoading = true
        networkManager.fetchWeatherForecast(forDays: days, location: city) { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.weatherData = data.forecast
                    self.isLoading = false
                    print(self.weatherData)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
