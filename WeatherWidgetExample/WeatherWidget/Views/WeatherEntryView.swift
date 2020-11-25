//
//  WeatherEntryView.swift
//  WeatherWidgetExtension
//
//  Created by Gi Pyo Kim on 11/23/20.
//

import SwiftUI

struct WeatherEntryView: View {
    let entry: WeatherEntry
    
    private let baseColor = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    
    var body: some View {
        ZStack {
            baseColor
            VStack {
                Text("La Habra")
                Text("\(entry.weather.temperature)°\(entry.weather.unit)")
                    .font(.largeTitle)
                Text(getWeatherIcon(conditionString: entry.weather.description))
                    .padding(.top, 10)
                Text(entry.weather.description)
                    .font(.footnote)
                HStack {
                    Spacer()
                    Text("updated: \(entry.date.timeOnly())")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray.opacity(0.5))
                }
            }.padding()
        }.edgesIgnoringSafeArea(.all)
    }
    
    func getWeatherIcon(conditionString: String) -> String {
        let current = conditionString.lowercased()
        
        switch current {
        case _ where current.contains("partly sunny"):
            return "⛅️"
        case _ where current.contains("cloudy"):
            return "☁️"
        case _ where current.contains("drizzle"):
            return "🌧"
        case _ where current.contains("sunny"):
            return "🌤"
        case _ where current.contains("clear"):
            return "☀️"
        default:
            return "🚫"
        }
    }
}
