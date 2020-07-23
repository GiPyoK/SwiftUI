//
//  ContentView.swift
//  Gestures-demo
//
//  Created by Gi Pyo Kim on 7/22/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapped: Bool = false
    
    var body: some View {
        Card(tapped: tapped)
        .gesture(TapGesture(count: 1)
            .onEnded({ _ in
                self.tapped.toggle()
            }))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
