//
//  ContentView.swift
//  Weather
//
//  Created by Gi Pyo Kim on 6/15/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter city name", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }.font(.custom("Arial", size: 50))
                .padding()
                .multilineTextAlignment(.center)
            
            Text("\(self.weatherVM.temperature)℉")
                .font(.custom("Arial", size: 50))
                .padding()
                .fixedSize()
                .foregroundColor(Color.white)
                .offset(y: 100)
            
            Text("\(self.weatherVM.humidity)%")
                .font(.custom("Arial", size: 50))
                .padding()
                .fixedSize()
                .foregroundColor(Color.white)
                .offset(y: 100)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
