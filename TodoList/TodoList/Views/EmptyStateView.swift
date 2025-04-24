//
//  EmptyStateView.swift
//  TodoList
//
//  Created by Leo on 24/04/25.
//

import SwiftUI

/// A structure that computes EmptyState.
///
struct EmptyStateView: View {
    // MARK: PROPERTIES
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("No tasks found!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the button and add a bunch of tasks to your list!")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView()) {
                        Text("Add new task 🔥")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                    }
                    
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.5)
    }
}

// MARK: PREVIEW
#Preview {
    NavigationStack {
        EmptyStateView()
            .navigationTitle(Text("Title"))
    }
}
