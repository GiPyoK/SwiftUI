//
//  NeumorphicImageButtonDark.swift
//  Neumorphism
//
//  Created by Gi Pyo Kim on 11/16/20.
//

import SwiftUI

struct NeumorphicImageButtonDark: View {
    
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
            
            print("hi")
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
                .if(self.isOn) { $0.glow(color: .green, radius: 8) }
                .background(self.isPressed ? LinearGradient(Color.darkEnd, Color.darkStart):LinearGradient(Color.darkStart, Color.darkEnd))
        }
        .clipShape(Circle())
        .if(!self.isPressed) { $0.convexNuemorphicDark() }
        .if(self.isPressed) { $0.concaveNuemorphicDark() }
        .scaleEffect(self.isPressed ? 0.95 : 1.0)
        
    }
        .transition(.identity)
        .animation(.easeInOut(duration: 0.25))
    }
}

