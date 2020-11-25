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
    private let darkColor = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemSmall:
            ZStack {
                baseColor
                WeatherView(weather: entry.weatherInfo[0], updatedDate: entry.date)
            }.edgesIgnoringSafeArea(.all)
            
        case .systemMedium:
            ZStack {
                baseColor
                HStack(spacing: 0) {
                    Rectangle().fill(baseColor)
                    Rectangle().fill(darkColor)
                }
                HStack {
                    WeatherView(weather: entry.weatherInfo[0], updatedDate: entry.date)
                    WeatherView(weather: entry.weatherInfo[1], updatedDate: entry.date)
                }
            }.edgesIgnoringSafeArea(.all)
            
        case .systemLarge:
            ZStack {
                Color(#colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1))
                VStack {
                    ZStack {
                        HStack(spacing: 0) {
                            Rectangle().fill(baseColor)
                            Rectangle().fill(darkColor)
                        }
                        HStack {
                            WeatherView(weather: entry.weatherInfo[0], updatedDate: entry.date)
                            WeatherView(weather: entry.weatherInfo[1], updatedDate: entry.date)
                        }
                    }
                    VStack {
                        HStack {
                            VStack {
                                DailyWeatherView(weather: entry.weatherInfo[2])
                                DailyWeatherView(weather: entry.weatherInfo[3])
                            }
                            Spacer()
                            VStack {
                                DailyWeatherView(weather: entry.weatherInfo[4])
                                DailyWeatherView(weather: entry.weatherInfo[5])
                            }
                            Spacer()
                            VStack {
                                DailyWeatherView(weather: entry.weatherInfo[6])
                                DailyWeatherView(weather: entry.weatherInfo[7])
                            }
                            Spacer()
                            VStack {
                                DailyWeatherView(weather: entry.weatherInfo[8])
                                DailyWeatherView(weather: entry.weatherInfo[9])
                            }
                        }
                    }.padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                }
            }.edgesIgnoringSafeArea(.all)
            
        default:
            ZStack {
                baseColor
                WeatherView(weather: entry.weatherInfo[0], updatedDate: entry.date)
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

//ZStack {
//    baseColor
//    VStack {
//        Text("La Habra")
//        Text("\(entry.weather.temperature)°\(entry.weather.unit)")
//            .font(.largeTitle)
//        Text(getWeatherIcon(conditionString: entry.weather.description))
//            .padding(.top, 10)
//        Text(entry.weather.description)
//            .font(.footnote)
//        HStack {
//            Spacer()
//            Text("updated: \(entry.date.timeOnly())")
//                .font(.system(size: 12))
//                .foregroundColor(Color.gray.opacity(0.5))
//        }
//    }.padding()
//}.edgesIgnoringSafeArea(.all)
