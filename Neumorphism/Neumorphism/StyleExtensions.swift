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
    
    func concaveNuemorphic<S: Shape>(shape: S) -> some View {
        self
        .overlay( shape
            .stroke(Color.darkShadow, lineWidth: 8)
            .blur(radius: 4)
            .offset(x: 2, y: 2)
            .mask(Circle().fill(LinearGradient(Color.black, Color.clear))))
        .overlay( shape
            .stroke(Color.lightShadow, lineWidth: 8)
            .blur(radius: 4)
            .offset(x: -2, y: -2)
            .mask(Circle().fill(LinearGradient(Color.clear, Color.black))))
    }
}

extension Color {
    static let darkShadow = Color.black.opacity(0.2)
    static let lightShadow = Color.white.opacity(0.7)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
