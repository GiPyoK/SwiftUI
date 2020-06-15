//
//  FancyScoreView.swift
//  SwiftUI-ObservableObject
//
//  Created by Gi Pyo Kim on 6/15/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct FancyScoreView: View {
    
    @EnvironmentObject var userSettings: UserSettings // send from outside
    
    var body: some View {
        VStack {
            Text("\(self.userSettings.score)")
            Button("Increament Score") {
                self.userSettings.score += 1
            }.padding().background(Color.green)
        }.padding().background(Color.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView().environmentObject(UserSettings())
    }
}
