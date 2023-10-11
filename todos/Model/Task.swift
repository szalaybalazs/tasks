//
//  Task.swift
//  todos
//
//  Created by Balázs on 11/10/2023.
//

import Foundation

struct Task: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var details: String?
    
    init(title: String, isCompleted: Bool = false, dueDate: Date = Date(), details: String? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.details = details
    }
    
    static func example() -> Task {
        Task(title: "Buy milk", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func examples() -> [Task] {
        [
            Task(title: "Test"),
            Task(title: "Paint walls", isCompleted: true),
            Task(title: "Electricts", dueDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!),
            Task(title: "Paint doors", dueDate: Calendar.current.date(byAdding: .day, value: 8, to: Date())!),
            Task(title: "Build bed", dueDate: Calendar.current.date(byAdding: .day, value: 6, to: Date())!),
            Task(title: "Clean everything up", dueDate: Calendar.current.date(byAdding: .day, value: 9, to: Date())!)
        ]
    }
}
