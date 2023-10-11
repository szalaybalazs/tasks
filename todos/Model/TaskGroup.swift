//
//  TaskGroup.swift
//  todos
//
//  Created by Balázs on 11/10/2023.
//

import Foundation

struct TaskGroup: Identifiable, Hashable {
    let id = UUID()
    var title: String
    let creationDate: Date
    var tasks: [Task]
    
    init(title: String, tasks: [Task] = []) {
        self.title = title
        self.creationDate = Date()
        self.tasks = tasks
    }
    
    static func example() -> TaskGroup {
        let task1 = Task(title: "Feed cats")
        let task2 = Task(title: "Clean litterbox")
        let task3 = Task(title: "Water plants")
        
        var group = TaskGroup(title: "Personal", tasks: [task1, task2, task3])
        return group
    }
    
    static func examples() -> [TaskGroup] {
        return [
            TaskGroup.example(),
            TaskGroup(title: "New Group")
        ]
    }
}
