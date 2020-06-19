//
//  CoreDataManager.swift
//  HotCoffee
//
//  Created by Gi Pyo Kim on 6/19/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
}
