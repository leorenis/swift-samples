//
//  TaskModel.swift
//  TodoList
//
//  Created by Leo on 21/04/25.
//

import Foundation

struct TaskModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    let order: Int
}
