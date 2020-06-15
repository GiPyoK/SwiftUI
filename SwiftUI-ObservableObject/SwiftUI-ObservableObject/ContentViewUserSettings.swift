//
//  ContentViewUserSettings.swift
//  SwiftUI-ObservableObject
//
//  Created by Gi Pyo Kim on 6/10/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct ContentViewUserSettings: View {
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("\(self.userSettings.score)")
                .font(.largeTitle)
            
            Button("Increament Score") {
                self.userSettings.score += 1
            }
            
            FancyScoreView()
        }
    }
}

struct ContentViewUserSettings_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewUserSettings().environmentObject(UserSettings())
    }
}
