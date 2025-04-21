//
//  ListView.swift
//  TodoList
//
//  Created by Leo on 21/04/25.
//

import SwiftUI

struct ListView: View {
    
    // MARK: PROPERTIES
    @State private var tasks: [TaskModel] = [
        TaskModel(title: "This the first task", isCompleted: true),
        TaskModel(title:"This the second task",isCompleted: false),
        TaskModel(title:"Third",isCompleted: false),
    ]
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        List {
            ForEach(tasks) { task in
                ListRowView(task: task)
            }
            .onDelete(perform: deleteTask)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Tasks 🚀")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
    
    
    /// performs remove method in array to delete  some task at IndexSet from tasks array.
    ///
    ///```
    ///deleteTask(indexSet)
    ///```
    /// - Parameters index : this is the IndexSet
    /// - Complexity: O(*n*) where *n* is the length of the collection.
    ///
    private func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
}


// MARK: PREVIEW
#Preview {
    NavigationStack {
        ListView()
    }
}
