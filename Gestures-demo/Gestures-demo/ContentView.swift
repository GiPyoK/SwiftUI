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
    @State private var cardDragState: CGSize = CGSize.zero
    
    var body: some View {
        Card(tapped: tapped)
            .animation(.spring())
            .offset(x: self.cardDragState.width, y: self.cardDragState.height)
            .gesture(DragGesture()
                        .onChanged { value in
                            self.cardDragState = value.translation
                        }
                        .onEnded{ value in
                            self.cardDragState = CGSize.zero
                        }
            )
            .gesture(TapGesture(count: 1)
                        .onEnded { _ in
                            self.tapped.toggle()
                        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
