//
//  OrderListViewModel.swift
//  HotCoffee
//
//  Created by Gi Pyo Kim on 6/23/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        self.orders = CoreDataManager.shared.getAllOrders().map(OrderViewModel.init)
        print(self.orders)
    }
}

class OrderViewModel {
    
    var name = ""
    var type = ""

    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
}
