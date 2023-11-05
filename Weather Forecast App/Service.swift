//
//  Service.swift
//  Weather Forecast App
//
//  Created by Jackson Matheus on 31/10/23.
//

import Foundation


struct City {
    let lat: String
    let lon: String
    let name: String
    
}


// e66ab461e1c54fd984192b461105b386

class Service {
    private let baseURL: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "c6118ee105c43a0bdac7452a44a2a8c3"
    
    private let session: URLSession = URLSession.shared
    
    func fetchData(city: City, _ completion: @escaping (ForecastResponse?) -> Void) {
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                // print(data, response)
                print(url)
                
                // Convert to a string and print
                if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                   print(JSONString)
                }
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            }catch {
                print(error)
                completion(nil)
            }
            
        }
        
        task.resume()
    }
}



// MARK: - ForecastResponse
struct ForecastResponse: Codable {
    // let current: Forecast
    let hourly: [Forecast]
    let daily: [DailyForecast]
}

// MARK: - Forecast
struct Forecast: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let windSpeed: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, temp, humidity
        case windSpeed = "wind_speed"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - DailyForecast
struct DailyForecast: Codable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}
