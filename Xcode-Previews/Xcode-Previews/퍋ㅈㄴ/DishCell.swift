//
//  DishCell.swift
//  Xcode-Previews
//
//  Created by Gi Pyo Kim on 6/17/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation
import SwiftUI

struct DishCell: View {
    var body: some View {
            Text("DishCell")
    }
}


#if DEBUG

struct DishCell_Preview: PreviewProvider {
    static var previews: some View {
        
        Group {
            // DishCell().colorScheme(.dark)
            
            // ContentSizeCategory
            
            DishCell().previewDevice("iPhone SE")
            
            DishCell().previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .extraSmall)
            
            DishCell().previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .large)
            
            DishCell().previewLayout(.sizeThatFits)
            .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}

#endif
