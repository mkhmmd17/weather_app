import Foundation

//MARK: - WeatherForecast
struct WeatherForecast: Codable, Identifiable {
    
    let id = UUID().uuidString
    let location: String
    let region: String
    let country: String
}
