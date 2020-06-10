//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Gi Pyo Kim on 6/10/20.
//  Copyright © 2020 gipgip. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var tasks = [Task]()
    
    private func addTask() {
        self.tasks.append(Task(name: "Fix the car"))
    }
    
    var body: some View {
        List {
            Button(action: addTask) {
                Text("Add Task")
            }
            
            ForEach(tasks) { task in
                Text(task.name)
            }
        }
    }
}

//struct ContentView: View {
//
//    @State var name: String = "John"
//
//    var body: some View {
//        VStack {
//            Text(name).font(.largeTitle)
//
//            Button(action: {
//                self.name = "Gi Pyo"
//            }) {
//                Text("Change Name")
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
