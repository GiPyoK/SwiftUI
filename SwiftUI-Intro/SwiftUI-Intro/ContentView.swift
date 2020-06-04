//
//  ContentView.swift
//  SwiftUI-Intro
//
//  Created by Gi Pyo Kim on 6/3/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let hikes = Hike.all()
    
    var body: some View {
        List(self.hikes, id: \.name) { hike in
            Text(hike.name)
                .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
