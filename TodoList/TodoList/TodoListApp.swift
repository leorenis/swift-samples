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
    // MARK: PROPERTIES
    @StateObject private var listViewModel: ListViewModel = ListViewModel()
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
