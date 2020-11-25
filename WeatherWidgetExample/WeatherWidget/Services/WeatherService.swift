//
//  WeatherService.swift
//  WeatherWidgetExtension
//
//  Created by Gi Pyo Kim on 11/23/20.
//

import SwiftUI

class WeatherService {
    let url = URL(string: "https://api.lil.software/weather?latitude=33.931870&longitude=-117.946129")!
    
    func getWeather(completion: @escaping (Result<[Weather], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(self.getWeatherResponse(fromData: data)))
        }.resume()
    }
    
    private func getWeatherResponse(fromData data: Data) -> [Weather] {
        let weatherData = try? JSONDecoder().decode(WeatherResponse.self, from: data)
        
        if let weather = weatherData {
            return weather.forecast
        }
        
        return [Weather(name: "Error", temperature: 0, unit: "", description: "Error")]
    }
}
