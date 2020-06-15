//
//  UserSettings.swift
//  SwiftUI-ObservableObject
//
//  Created by Gi Pyo Kim on 6/10/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class UserSettings: ObservableObject {
    @Published var score: Int = 0
    
}
