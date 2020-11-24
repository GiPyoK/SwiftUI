//
//  SimpleWidgetEntryView.swift
//  Neumorphism
//
//  Created by Gi Pyo Kim on 11/23/20.
//

import SwiftUI

struct SimpleWidgetEntryView: View {
    let entry: SimpleWidgetEntry
    
    var body: some View {
        ZStack {
            VStack (spacing: 5) {
                Text(getMonth())
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .background(Rectangle().fill(Color.red))
                
                Text(getDay())
                Text(getDate())
                    .font(.largeTitle)
            }
            .background(Rectangle().fill(Color(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1))))
            .padding(20)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
        }.edgesIgnoringSafeArea(.all)
    }
    
    private func getDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: entry.date)
    }
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: entry.date)
    }
    private func getMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: entry.date)
    }
}
