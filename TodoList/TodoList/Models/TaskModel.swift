//
//  TaskModel.swift
//  TodoList
//
//  Created by Leo on 21/04/25.
//

import Foundation

/// Imutable struct to represents TaskModel
struct TaskModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    /// Init an Imutable struct TaskModel.
    ///
    /// When TaskModel receive a id, creates a new TaskModel preserving the id provided.
    /// Otherwise, creates a new Task model with a new UUID as string.
    ///
    ///```
    ///init(id: String = UUID().uuidString, title: String, isCompleted: Bool)
    ///```
    ///
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    /// Performs toggle for isCompleted property.
    ///
    ///```
    ///toggleCompletion() ->TaskModel(id: id, title: title, isCompleted: !isCompleted)
    ///```
    /// - Returns: Returns a new TaskModel changing the isCompleted property.
    /// - Complexity: O(1) on average, only create a new TaskModel with the same data, only toggle isCompleted property.
    ///
    func toggleCompletion() -> TaskModel {
        return TaskModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
