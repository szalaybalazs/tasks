//
//  SidebarView.swift
//  todos
//
//  Created by Balázs on 11/10/2023.
//

import Foundation
import SwiftUI

struct SidebarView: View {
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection
    
    var body: some View {
        List(selection: $selection) {
            Section("Favourites") {
                ForEach(TaskSection.allCases) { selection in
                    Label(selection.displayName, systemImage: selection.iconName)
                        .tag(selection)
                }
            }
            Section("Groups") {
                ForEach($userCreatedGroups) { $group in
                    HStack {
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }.tag(TaskSection.list(group))
                        .contextMenu(ContextMenu(menuItems: {
                            Button("Delete", role: .destructive) {
                                if let index = userCreatedGroups.firstIndex(where: { $0.id == group.id}) {
                                    userCreatedGroups.remove(at: index)
                                }
                            }
                        }))
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                let newGroup = TaskGroup(title: "New Group")
                userCreatedGroups.append(newGroup)
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
                .buttonStyle(.borderless).foregroundColor(.accentColor)
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//                .keyboardShortcut(KeyEquivalent("a"), modifiers: .command)
        }
    }
}


#Preview {
    SidebarView(userCreatedGroups: .constant(TaskGroup.examples()), selection: .constant(.all))
        .listStyle(.sidebar)
}
