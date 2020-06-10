//
//  FancyTimer.swift
//  SwiftUI-ObservableObject
//
//  Created by Gi Pyo Kim on 6/10/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class FancyTimer: ObservableObject {
    @Published var value: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.value += 1
        }
    }
}
