//
//  SimpleWidgetTimeline.swift
//  simpleWidgetExtension
//
//  Created by Gi Pyo Kim on 11/23/20.
//

import WidgetKit
import SwiftUI

struct SimpleWidgetTimeline: TimelineProvider {
    typealias Entry = SimpleWidgetEntry
    
    func placeholder(in context: Context) -> SimpleWidgetEntry {
        return SimpleWidgetEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleWidgetEntry) -> Void) {
        let entry = SimpleWidgetEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleWidgetEntry>) -> Void) {
        var entries: [SimpleWidgetEntry] = []
        let currentDate = Date()
        
        for dayOffset in 0..<7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let entry = SimpleWidgetEntry(date: entryDate)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    
    
}
