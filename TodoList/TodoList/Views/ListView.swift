//
//  ListView.swift
//  TodoList
//
//  Created by Leo on 21/04/25.
//

import SwiftUI

struct ListView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject private var listViewModel: ListViewModel
    
    /// View body: block is responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            if listViewModel.tasks.isEmpty {
                EmptyStateView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.tasks) { task in
                        ListRowView(task: task)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateTask(task: task)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteTask)
                    .onMove(perform: listViewModel.moveTask)
                }
                .listStyle(PlainListStyle())
            }
        }
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
#Preview(traits: .portrait) {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}

#Preview(traits: .portrait) {
    NavigationStack {
        ListView()
    }
    .preferredColorScheme(.dark)
    .environmentObject(ListViewModel())
}
