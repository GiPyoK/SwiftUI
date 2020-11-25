//
//  WeatherUtil.swift
//  WeatherWidgetExtension
//
//  Created by Gi Pyo Kim on 11/24/20.
//

import SwiftUI

struct WeatherUtils {
    static func getWeatherIcon(conditionString: String) -> String {
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
