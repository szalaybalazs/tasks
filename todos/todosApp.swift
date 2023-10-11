//
//  todosApp.swift
//  todos
//
//  Created by Balázs on 11/10/2023.
//

import SwiftUI

@main
struct todosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Task") {
                Button("Add new Task") {
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            CommandGroup(after: .newItem) {
                Button("Add new Group") {
                    
                }
            }
        }
        WindowGroup("Special Window") {
            Text("Special Window")
                .frame(minWidth: 200, idealWidth: 300, minHeight: 200)
        }
        .windowToolbarStyle(.expanded)
        
        Settings {
            Text("Settings")
                .frame(minWidth: 200, maxWidth: 600, minHeight: 160, maxHeight: .infinity)
        }
        MenuBarExtra("menu") {
            Button("ALMACSUTKAAAAA") {
            }
        }
    }
}
