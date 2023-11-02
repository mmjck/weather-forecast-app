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




class Service {
    private let baseURL: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "c6118ee105c43a0bdac7452a44a2a8c3"
    
    private let session: URLSession = URLSession.shared
    
    func fetchData(city: City, _ completion: () -> Void) {
        /*let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"

        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { data, response error in
            print("oi")
        }
        
        task.resume()
         */
        
    }
}
