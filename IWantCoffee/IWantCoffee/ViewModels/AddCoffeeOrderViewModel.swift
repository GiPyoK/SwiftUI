//
//  AddCoffeeOrderViewModel.swift
//  IWantCoffee
//
//  Created by Gi Pyo Kim on 6/16/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    private var webSercive: WebService
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    init() {
        self.webSercive = WebService()
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small" : 2.0, "Medium" : 3.0, "Large" : 4.0]
        return prices[self.size]!
    }
    
    func placeOrder() {
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        
        self.webSercive.createCoffeeOrder(order: order) { (response) in
            guard let response = response, response.success else {
                return
            }
            
        }
    }
}
