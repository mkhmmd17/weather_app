import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    
    let networkManager = NetworkManager()
    
    @Published var weatherData: [WeatherForecast] = []
    @Published var days: Int = 0
    @Published var city: String = ""
    
    
    init() {
        networkManager.fetchWeatherForecast(forDays: 20, location: "Chicago") { [unowned self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.weatherData = [data]
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
