//
//  StyleExtensions.swift
//  Neumorphism
//
//  Created by Gi Pyo Kim on 11/15/20.
//

import Foundation
import SwiftUI

extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> TupleView<(Self?, Content?)> {
        if conditional { return TupleView((nil, content(self))) }
        else { return TupleView((self, nil)) }
    }
    
    func glow(color: Color = .green, radius: CGFloat = 16) -> some View {
        self
            .overlay(self.blur(radius: radius / 10))
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
    
    func convexNuemorphicLight() -> some View {
        self
//            .shadow(color: Color.darkShadow, radius: 10, x: 10, y: 10)
//            .shadow(color: Color.lightShadow, radius: 10, x: -5, y: -5)
            .shadow(color: Color.lightStart, radius: 10, x: -10, y: -10)
            .shadow(color: Color.lightEnd, radius: 10, x: 10, y: 10)
    }
    
    func concaveNuemorphicLight<S: Shape>(shape: S) -> some View {
        self
//        .overlay( shape
//            .stroke(Color.darkShadow, lineWidth: 8)
//            .blur(radius: 4)
//            .offset(x: 2, y: 2)
//            .mask(Circle().fill(LinearGradient(Color.black, Color.clear))))
//        .overlay( shape
//            .stroke(Color.lightShadow, lineWidth: 8)
//            .blur(radius: 4)
//            .offset(x: -2, y: -2)
//            .mask(Circle().fill(LinearGradient(Color.clear, Color.black))))
            .shadow(color: Color.lightStart, radius: 10, x: 5, y: 5)
            .shadow(color: Color.lightEnd, radius: 10, x: -5, y: -5)
    }
    
    func convexNuemorphicDark() -> some View {
        self
            .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
            .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            
    }
    
    func concaveNuemorphicDark() -> some View {
        self
            .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
            .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
    }
}

extension Color {
    // light mode
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkShadow = Color.black.opacity(0.2)
    static let lightShadow = Color.white.opacity(0.7)
    
    static let lightStart = Color.white
    static let lightEnd = Color(red: 196/255, green: 198/255, blue: 199/255)
    
    // dark mode
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
