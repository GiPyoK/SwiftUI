//
//  WebService.swift
//  IWantCoffee
//
//  Created by Gi Pyo Kim on 6/15/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation

class WebService {
    private let baseURL = URL(string: "https://coffe-order.glitch.me")!
    
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        let requestURL = self.baseURL.appendingPathComponent("orders")
        
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
        }.resume()
    }
}
