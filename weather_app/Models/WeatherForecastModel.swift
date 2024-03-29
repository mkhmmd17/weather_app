import Foundation

//MARK: - WeatherForecast
import Foundation

// MARK: - Weather
struct WeatherForecast: Codable {
    
    let location: String
    let forecast: [Forecast]

    enum CodingKeys: String, CodingKey {
        case location
        case forecast
    }
}

// MARK: - Forecast
struct Forecast: Codable, Identifiable {
    let id = UUID().uuidString
    let date: String
    let maxTempC, minTempC: Double

    enum CodingKeys: String, CodingKey {
        case date
        case maxTempC = "max_temp_c"
        case minTempC = "min_temp_c"
    }
}
