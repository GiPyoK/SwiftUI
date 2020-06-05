//
//  GridView.swift
//  SwiftUI-Intro
//
//  Created by Gi Pyo Kim on 6/4/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct GridView: View {
    
    let dishes = Dish.all()
    
    var body: some View {
        let chunkedDishes = dishes.chunked(into: 2)
        return List {
            ForEach(0..<chunkedDishes.count) { index in
                HStack {
                    ForEach(chunkedDishes[index]) { dish in
                        Image(dish.imageURL)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
//        List {
//            // rows
//            ForEach(0..<5) { _ in
//                HStack {
//                    // columns
//                    ForEach(0..<2) { _ in
//                        Image("sal")
//                            .resizable()
//                            .scaledToFit()
//                    }
//                }
//            }
//        }
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
