//
//  NeumorphicImageButton.swift
//  Neumorphism
//
//  Created by Gi Pyo Kim on 11/13/20.
//

import SwiftUI

struct NeumorphicImageButton: View {
    
    @State private var isPressed: Bool = false
    
    private var image: Image
    private var imageColor: Color
    private var backgroundColor: Color
    
    private var onTap: () -> Void
    
    init(image: Image, imageColor: Color, backgroundColor: Color, onTap: @escaping () -> Void) {
        self.image = image
        self.imageColor = imageColor
        self.backgroundColor = backgroundColor
        self.onTap = onTap
    }
    
    var darkShadow: Color {
        return Color.black.opacity(0.2)
    }
    
    var lightShadow: Color {
        return Color.white.opacity(0.7)
    }
    
    var body: some View {
        ZStack {
        Button(action: {
            
            self.isPressed.toggle()
            self.onTap()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.isPressed = false
            }
            
        }) {
            image
                .resizable()
                .frame(width: 60, height: 60)
                .padding(30)
                .foregroundColor(imageColor)
                .background(backgroundColor)
                .if(self.isPressed) { $0.glow(color: .green, radius: 8) }
        }
        .clipShape(Circle())
        .if(!self.isPressed) { $0.shadow(color: darkShadow, radius: 10, x: 10, y: 10)
            .shadow(color: lightShadow, radius: 10, x: -5, y: -5) }
        .if(self.isPressed) { $0.concaveNuemorphic(shape: Circle()) }
        .scaleEffect(self.isPressed ? 0.95 : 1.0)
        
    }
        .transition(.identity)
        .animation(.easeInOut(duration: 0.25))
    }
}




