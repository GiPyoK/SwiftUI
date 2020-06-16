//
//  ContentView.swift
//  IWantCoffee
//
//  Created by Gi Pyo Kim on 6/15/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    var body: some View {
        
        NavigationView {
            OrderListView(orders:self.orderListVM.orders)
            .navigationBarTitle("Coffee Orders")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
