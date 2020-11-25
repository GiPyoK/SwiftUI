//
//  WeatherView.swift
//  WeatherWidgetExtension
//
//  Created by Gi Pyo Kim on 11/24/20.
//

import SwiftUI

struct WeatherView: View {
    let weather: Weather
    let updatedDate: Date
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("La Habra")
            Text("\(weather.temperature)°\(weather.unit)")
                .font(.largeTitle)
            Spacer()
            Text(WeatherUtils.getWeatherIcon(conditionString: weather.description))
            Text(weather.description)
                .font(.footnote)
            Spacer()
            
            HStack {
                Spacer()
                Text("Updated: \(updatedDate.timeOnly())")
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray.opacity(0.8))
            }
        }.padding(16)
    }
}
