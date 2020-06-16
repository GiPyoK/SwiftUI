//
//  CoffeeViewModel.swift
//  IWantCoffee
//
//  Created by Gi Pyo Kim on 6/16/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    
    var coffee: Coffee
    
    var name: String {
        return self.coffee.name
    }
    
    var imageURL: String {
        return self.coffee.imageURL
    }
    
    var price: Double {
        return self.coffee.price
    }
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
}
