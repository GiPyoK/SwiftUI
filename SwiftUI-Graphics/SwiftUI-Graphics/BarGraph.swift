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
    
    let reports: [Report]
    
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
//                Rectangle()
//                    .fill(Color.orange)
//                    .frame(width: 100, height: 180)
//                    .padding(2)
//
//                Rectangle()
//                    .fill(Color.green)
//                    .frame(width: 100, height: 240)
//                    .padding(2)
//
//                Rectangle()
//                    .fill(Color.blue)
//                    .frame(width: 100, height: 360)
//                    .padding(2)
//
//                Spacer()
                
                ForEach(self.reports, id: \.year) { report in
                    BarView(report: report)
                }
            }
        }
    }
}

struct BarView: View {
    let report: Report
    @State private var showGraph: Bool = false
    
    var body: some View {
        let value = report.revenue / 500
        let yValue = Swift.min(value * 20, 500)
        
        return VStack {
            Text(String(format: "$%.2f", report.revenue))
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: self.showGraph ? CGFloat(yValue) : 0.0)
            
                .onAppear{
                    withAnimation(.spring()) {
                        self.showGraph = true
                    }
            }
            Text(report.year)
        }
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        BarGraph(reports: Report.all())
    }
}
