//
//  ContentView.swift
//  HotCoffee
//
//  Created by Gi Pyo Kim on 6/19/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVM: OrderListViewModel
    
    init() {
        self.orderListVM = OrderListViewModel()
    }
    
    var body: some View {
        AddOrderView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
