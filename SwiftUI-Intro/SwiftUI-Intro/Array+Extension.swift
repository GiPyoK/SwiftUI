//
//  Array+Extension.swift
//  SwiftUI-Intro
//
//  Created by Gi Pyo Kim on 6/4/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
