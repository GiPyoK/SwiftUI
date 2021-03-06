//
//  NeumorphicImageButton.swift
//  Neumorphism
//
//  Created by Gi Pyo Kim on 11/13/20.
//

import SwiftUI

struct NeumorphicImageButton: View {
    
    @State private var isPressed: Bool = false
    @State private var isOn: Bool = false
    
    private var image: Image
    private var imageColor: Color
    private var imageSize: CGFloat
    private var buttonColor: Color
    private var buttonSize: CGFloat
    
    private var onTap: () -> Void
    
    init(image: Image, imageColor: Color, imageSize: CGFloat, buttonColor: Color, buttonSize: CGFloat, onTap: @escaping () -> Void) {
        self.image = image
        self.imageColor = imageColor
        self.imageSize = imageSize
        self.buttonColor = buttonColor
        self.buttonSize = buttonSize
        self.onTap = onTap
    }
    
    var body: some View {
        ZStack {
        Button(action: {
            
            self.isPressed.toggle()
            self.isOn.toggle()
            self.onTap()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.isPressed = false
            }
            
        }) {
            image
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .padding(buttonSize)
                .foregroundColor(imageColor)
                .background(buttonColor)
                .if(self.isOn) { $0.glow(color: .green, radius: 8) }
        }
        .clipShape(Circle())
        .if(!self.isPressed) { $0.convexNuemorphicLight() }
        .if(self.isPressed) { $0.concaveNuemorphicLight(shape: Circle()) }
        .scaleEffect(self.isPressed ? 0.95 : 1.0)
        
    }
        .transition(.identity)
        .animation(.easeInOut(duration: 0.25))
    }
}




