//
//  ContentView.swift
//  SwiftUI-ObservableObject
//
//  Created by Gi Pyo Kim on 6/10/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fancyTimer = FancyTimer()
    
    var body: some View {
        Text("\(self.fancyTimer.value)")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
