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
        ZStack {
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
        }
        .clipShape(Circle())
        .if(!self.isPressed) { $0.shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5) }
        .if(self.isPressed) { $0.overlay(
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
        ) }
        .scaleEffect(self.isPressed ? 0.95 : 1.0)
        
    }
        .transition(.identity)
        .animation(.easeInOut)
    }
}

extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> TupleView<(Self?, Content?)> {
        if conditional { return TupleView((nil, content(self))) }
        else { return TupleView((self, nil)) }
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct NeumorphicImageButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicImageButton(systemName: "car") {}
    }
}


