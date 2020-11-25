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
        return WeatherEntry(date: Date(), weather: Weather(name: "placeholder", temperature: 420, unit: "C", description: "jas"))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        let entry = WeatherEntry(date: Date(), weather: Weather(name: "Snapshot", temperature: 69, unit: "F", description: "jas"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        
        WeatherService().getWeather { (result) in
            let weather: Weather
            
            if case .success(let fetchedData) = result {
                weather = fetchedData.first!
            } else {
                weather = Weather(name: "Error", temperature: 0, unit: "F", description: "Error fetching weather")
            }
            
            let entry = WeatherEntry(date: currentDate, weather: weather)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
    
    
}
