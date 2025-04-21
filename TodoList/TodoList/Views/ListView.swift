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
    var body: some View {
        List {
            ForEach(tasks) { task in
                ListRowView(task: task)
            }
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
}


// MARK: PREVIEW
#Preview {
    NavigationStack {
        ListView()
    }
}
