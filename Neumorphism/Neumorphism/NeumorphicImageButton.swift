//
//  NeumorphicImageButton.swift
//  Neumorphism
//
//  Created by Gi Pyo Kim on 11/13/20.
//

import SwiftUI

struct NeumorphicImageButton: View {
    
    @State private var isPressed: Bool = false
    
    private var systemName: String
    private var onTap: () -> Void
    
    init(systemName: String, onTap: @escaping () -> Void) {
        self.systemName = systemName
        self.onTap = onTap
    }
    
    var gray: Color {
        return Color.black.opacity(0.2)
    }
    
    var white: Color {
        return Color.white.opacity(0.7)
    }
    
    var body: some View {
        Button(action: {
            
            self.isPressed.toggle()
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//                self.isPressed = false
//                self.onTap()
//            }
            
        }) {
            Image(systemName:  "car.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(30)
                .foregroundColor(self.isPressed ? Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.199406036)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .background(Color.offWhite)
        }.clipShape(Circle())
        .shadow(color: self.isPressed ? white: gray,
                radius: self.isPressed ? 4 : 10,x: 10, y: 10)
        .shadow(color: self.isPressed ? gray: white,
                radius: self.isPressed ? 4: 10, x: -5, y: -5)
        .scaleEffect(self.isPressed ? 0.95 : 1.0)
        .animation(.spring())
    }
}

struct NeumorphicImageButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicImageButton(systemName: "car") {}
    }
}
