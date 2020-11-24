//
//  simpleWidget.swift
//  simpleWidget
//
//  Created by Gi Pyo Kim on 11/19/20.
//

import WidgetKit
import SwiftUI

@main
struct SimpleWidget: Widget {
    
    private let kind: String = "SimpleWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: SimpleWidgetTimeline()) { entry in
            SimpleWidgetEntryView(entry: entry)
        }
    }
}
