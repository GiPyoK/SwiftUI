//
//  ExpenseWidget.swift
//  ExpenseWidget
//
//  Created by Gi Pyo Kim on 12/2/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    typealias Intent = ViewMonthlyExpenseIntent
    
    public typealias Entry = ExpenseEntry
    
    func category(for config: ViewMonthlyExpenseIntent) -> ExpenseCategory {
        switch config.category {
        case .all:
            return .all
        case .food:
            return .food
        case .gas:
            return .gas
        case .grocery:
            return .grocery
        case .rent:
            return .rent
        default:
            return .all
        }
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (ExpenseEntry) -> Void) {
        let entry = ExpenseEntry(date: Date(), category: category(for: configuration))
        completion(entry)
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<ExpenseEntry>) -> Void) {
        var entries: [ExpenseEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0..<5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = ExpenseEntry(date: entryDate, category: category(for: configuration))
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func placeholder(in context: Context) -> ExpenseEntry {
        return ExpenseEntry(date: Date(), category: .all)
    }
}

struct ExpenseEntry: TimelineEntry {
    public let date: Date
    public let category: ExpenseCategory
}

public enum ExpenseCategory: Int {
    case all = 1
    case food
    case grocery
    case gas
    case rent
    
    func description() -> String {
        switch self {
        case .all:
            return "All"
        case .food:
            return "Food"
        case .gas:
            return "Gas"
        case .grocery:
            return "Grocery"
        case.rent:
            return "Rent"
        }
    }
}
