//
//  TodoListApp.swift
//  TodoList
//
//  Created by Leo on 21/04/25.
//

import SwiftUI

/**
 * MVVM Architecture
 *
 * Model:              Data Point
 * View:                UI
 * ViewModel:      Manages Models for Views
 *
 */

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
    }
}
