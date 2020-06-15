//
//  Weather.swift
//  Weather
//
//  Created by Gi Pyo Kim on 6/15/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct WeatherResponse: Decodable {
    let main: WeatherModel
}

struct WeatherModel: Decodable {
    var temp: Double?
    var humidity: Double?
}
