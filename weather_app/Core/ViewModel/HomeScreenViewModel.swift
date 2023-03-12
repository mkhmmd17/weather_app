import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    
    let networkManager = NetworkManager()
    
    @Published var weatherData: [Forecast] = []
    @Published var days: Int = 0
    @Published var city: String = ""
    
    
    func getWeather() {
        networkManager.fetchWeatherForecast(forDays: days, location: city) { [unowned self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.weatherData = data.forecast
                    print(self.weatherData)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    func getWeatherArray() {
//        
//        
//    }
}
