//
//  WeatherResponse.swift
//  WeatherWidgetExtension
//
//  Created by Gi Pyo Kim on 11/23/20.
//

import Foundation

struct WeatherResponse: Codable {
    let forecast: [Weather]
}
