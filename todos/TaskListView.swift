//
//  TaskListView.swift
//  todos
//
//  Created by Balázs on 11/10/2023.
//

import SwiftUI

struct TaskListView: View {
    let title: String
    @Binding var tasks: [Task]
    @State private var inspectorIsShown: Bool = false
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        List($tasks) { $task in
           TaskView(task: $task, selectedTask: $selectedTask)
        }
        .navigationTitle(title)
        .toolbar {
            ToolbarItemGroup {
                Button{
                    tasks.append(Task(title: "New Task"))
                } label: {
                    Label("Add New Task", systemImage: "plus")
                }
                Button{
                    inspectorIsShown.toggle()
                } label: {
                    Label("Show inspector", systemImage: "sidebar.right")
                }
            }
            
        }
        .inspector(isPresented: $inspectorIsShown) {
            Group {
                
                if let selectedTask {
                    Text(selectedTask.title).font(.title)
                } else {
                    Text("Nothing is selected")
                }
            }
            .frame(minWidth: 100, maxWidth: .infinity)
            
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
