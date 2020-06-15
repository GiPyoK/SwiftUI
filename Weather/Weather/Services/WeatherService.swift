//
//  WeatherService.swift
//  Weather
//
//  Created by Gi Pyo Kim on 6/15/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (WeatherModel?) -> ()) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=7f0a6369a06918fc7010f1239b0e0d43&units=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
