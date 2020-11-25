//
//  WeatherTimeline.swift
//  WeatherWidgetExtension
//
//  Created by Gi Pyo Kim on 11/23/20.
//

import WidgetKit
import SwiftUI

struct WeatherTimeline: TimelineProvider {
    typealias Entry = WeatherEntry
    
    func placeholder(in context: Context) -> WeatherEntry {
        var weatherSnap = [Weather]()
        
        for _ in 0...9 {
            weatherSnap.append(Weather(name: "placeholder", temperature: 420, unit: "C", description: "jas"))
        }
        
        let entry = WeatherEntry(date: Date(), weatherInfo: weatherSnap)
            
        return entry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        var weatherSnap = [Weather]()
        
        for _ in 0...9 {
            weatherSnap.append(Weather(name: "Snapshot", temperature: 69, unit: "F", description: "jas"))
        }
        
        let entry = WeatherEntry(date: Date(), weatherInfo: weatherSnap)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        
        WeatherService().getWeather { (result) in
            let weatherInfo: [Weather]
            
            if case .success(let fetchedData) = result {
                weatherInfo = fetchedData
            } else {
                let errorWeather = Weather(name: "Error", temperature: 0, unit: "F", description: "Error fetching weather")
                weatherInfo = [errorWeather, errorWeather]
            }
            
            let entry = WeatherEntry(date: currentDate, weatherInfo: weatherInfo)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}
