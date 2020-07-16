//
//  BarGraph.swift
//  SwiftUI-Graphics
//
//  Created by Gi Pyo Kim on 7/14/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation
import SwiftUI

struct BarGraph: View {
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 100, height: 180)
                    .padding(2)
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 100, height: 240)
                    .padding(2)
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 360)
                    .padding(2)
                
                Spacer()
            }
        }
    }
}


struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        BarGraph()
    }
}
