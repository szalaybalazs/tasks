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
    @FocusState private var focusedField: TaskGroup.ID?
    @State private var showingDeleteConfirmation = false  // State to control the display of the confirmation dialog

        // Define a method to handle deletion based on a group id
        func deleteSelectedGroup() {
            guard selection.taskGroup != nil else { return }
            showingDeleteConfirmation = true  // Show confirmation dialog
        }
        
        var deleteConfirmation: Alert {
            Alert(
                title: Text("Delete Group"),
                message: Text("Are you sure you want to delete this group?"),
                primaryButton: .destructive(Text("Delete")) {
                    guard let selectedGroup = selection.taskGroup,
                          let index = userCreatedGroups.firstIndex(where: { $0.id == selectedGroup.id }) else { return }
                    userCreatedGroups.remove(at: index)
                },
                secondaryButton: .cancel()
            )
        }

    
    var body: some View {
        VStack {
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
                                .focused($focusedField, equals: group.id)
                        }.tag(TaskSection.list(group))
                            .contextMenu(ContextMenu(menuItems: {
                                Button("Delete", role: .destructive) {
                                    if let index = userCreatedGroups.firstIndex(where: { $0.id == group.id}) {
                                        userCreatedGroups.remove(at: index)
                                    }
                                }.keyboardShortcut(KeyEquivalent("\u{8}"), modifiers: [.command])
                            }))
                    }
                }
                
            }
            Button(action: self.deleteSelectedGroup) {
                EmptyView()
            }
            .buttonStyle(.borderless)
            .keyboardShortcut(KeyEquivalent("\u{8}"), modifiers: [.command])
            .opacity(0)
        }
        
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                let newGroup = TaskGroup(title: "New Group")
                userCreatedGroups.append(newGroup)
                focusedField = newGroup.id
                selection = TaskSection.list(newGroup)
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
                .buttonStyle(.borderless).foregroundColor(.accentColor)
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .keyboardShortcut(KeyEquivalent("n"), modifiers: [.command, .shift])
        }
        .alert(isPresented: $showingDeleteConfirmation, content: { deleteConfirmation })  // Show confirmation dialog when needed
        
    }
        
}


#Preview {
    SidebarView(userCreatedGroups: .constant(TaskGroup.examples()), selection: .constant(.all))
        .listStyle(.sidebar)
}
