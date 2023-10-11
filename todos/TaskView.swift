//
//  TaskView.swift
//  todos
//
//  Created by Balázs on 11/10/2023.
//

import SwiftUI

struct TaskView: View {
    @Binding var task: Task
    @Binding var selectedTask: Task?

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New Task", text: $task.title).textFieldStyle(.plain)
            Button(action: {
                selectedTask = task
            }, label: {
                Text("More")
            })
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.example()), selectedTask: .constant(nil)).padding()
}
