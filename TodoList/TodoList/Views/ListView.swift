//
//  ListView.swift
//  TodoList
//
//  Created by Leo on 21/04/25.
//

import SwiftUI

struct ListView: View {
    
    // MARK: PROPERTIES
    @State private var tasks: [String] = [
        "This the first task",
        "This the second task",
        "Third",
    ]
    var body: some View {
        List {
            ForEach(tasks, id: \.self) { task in
                ListRowView(title: task)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Tasks 🚀")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: Text("Destination Add"))
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
