import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    enum APIError: Error {
        case invalidURL
        case requestFailed
        case invalidData
    }
    
    private let baseURL = "https://api.m3o.com/v1/weather/Forecast"
    private let apiKey = "M2YwMTE5YjEtMGE1NS00MjEzLWJkMjctZDQ0NTJiMWRlNTc0"
    
    func fetchWeatherForecast(forDays days: Int, location: String, completion: @escaping (Result<WeatherForecast, Error>) -> Void) {
        
        let parameters: [String: Any] = [
            "days": days,
            "location": location
        ]
        
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                completion(.failure(APIError.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherForecast = try decoder.decode(WeatherForecast.self, from: data)
                completion(.success(weatherForecast))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    
}
