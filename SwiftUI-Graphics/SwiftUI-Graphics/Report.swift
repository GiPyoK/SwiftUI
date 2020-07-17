//
//  Report.swift
//  SwiftUI-Graphics
//
//  Created by Gi Pyo Kim on 7/16/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation

struct Report: Hashable {
    let year: String
    let revenue: Double
}

extension Report {
    static func all() -> [Report] {
        return [
            Report(year: "2001", revenue: 2400),
            Report(year: "2003", revenue: 3560),
            Report(year: "2004", revenue: 5000)
        ]
    }
}
