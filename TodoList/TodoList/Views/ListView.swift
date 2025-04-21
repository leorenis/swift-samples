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
        TaskModel(title:"This the second task", isCompleted: false),
        TaskModel(title:"Third", isCompleted: false),
    ]
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        List {
            ForEach(tasks) { task in
                ListRowView(task: task)
            }
            .onDelete(perform: deleteTask)
            .onMove(perform: moveTask)
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
    /// - Parameters:
    ///    - index : this is the IndexSet
    ///
    /// - Complexity: O(*n*) where *n* is the length of the collection.
    ///
    private func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    /// Moves all the elements at the specified offsets to the specified destination offset, preserving ordering.
    ///
    ///```
    ///moveTask(from, to)
    ///```
    /// - Parameters:
    ///   - source: An index set representing the offsets of all elements that
    ///     should be moved.
    ///   - destination: The offset of the element before which to insert the
    ///     moved elements. `destination` must be in the closed range
    ///     `0...count`.
    ///
    /// - Complexity: O(*n* log *n*), where *n* is the length of the collection.
    private func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
}

// MARK: PREVIEW
#Preview {
    NavigationStack {
        ListView()
    }
}
