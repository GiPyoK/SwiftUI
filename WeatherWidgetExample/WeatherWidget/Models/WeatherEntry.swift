//
//  WeatherEntry.swift
//  WeatherWidgetExtension
//
//  Created by Gi Pyo Kim on 11/23/20.
//

import WidgetKit
import SwiftUI

struct WeatherEntry: TimelineEntry {
    public let date: Date
    public let weather: Weather
    
    var relevance: TimelineEntryRelevance? {
        return TimelineEntryRelevance(score: 50)
    }
}
