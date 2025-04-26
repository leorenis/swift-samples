//
//  ListRowView.swift
//  TodoList
//
//  Created by Leo on 21/04/25.
//

import SwiftUI

/// A structure that computes row views on demand.
///
/// - Parameters:
///   - title: The sections title view.
struct ListRowView: View {
    
    // MARK: PROPERTIES
    var task: TaskModel
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isCompleted ? Color(.systemGreen) : Color(.accentSecondary))
            Text(task.title)
            Spacer()
        }
        .font(.body)
    }
}
