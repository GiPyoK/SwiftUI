//
//  ContentView.swift
//  Neumorphism
//
//  Created by Gi Pyo Kim on 11/13/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.offWhite
            
            VStack {
                NeumorphicImageButton(systemName: "car") {
                    // onTap event
                }
                    .padding()
                
                Button(action: {}, label: {
                    Image(systemName: "car")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 60, height: 60)
                }).buttonStyle(NuemorphicButtonStyle())
                
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NuemorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                            )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}