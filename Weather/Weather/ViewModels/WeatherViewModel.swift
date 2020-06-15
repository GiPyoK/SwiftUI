//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Gi Pyo Kim on 6/15/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
        
    private var weatherService: WeatherService
    
    @Published var weather = WeatherModel()
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    init() {
        self.weatherService = WeatherService()
    }
    
    private func fetchWeather(by city: String) {
        self.weatherService.getWeather(city: city) { (weather) in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather                    
                }
            }
        }
    }
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
}
