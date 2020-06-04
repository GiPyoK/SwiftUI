//
//  HikeDetailView.swift
//  SwiftUI-Intro
//
//  Created by Gi Pyo Kim on 6/3/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct HikeDetailView: View {
    
    let hike: Hike
    
    var body: some View {
        VStack {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(hike.name)
            Text(String(format: "%.2f miles", hike.miles))
        }
    }
}

struct HikeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetailView(hike: Hike(name: "Angels Landing", imageURL: "tam", miles: 10.9))
    }
}
