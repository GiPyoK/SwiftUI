//
//  OrderTotalView.swift
//  IWantCoffee
//
//  Created by Gi Pyo Kim on 6/16/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            Text(String(format: "$%.2f", self.total))
                .font(.title)
                .foregroundColor(Color.green)
            
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 23.23)
    }
}
