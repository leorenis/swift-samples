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
    @State private var animate: Bool = false
    let secundaryAccentColor: Color = Color(.accentSecondary)
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
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
                            .background(animate ? secundaryAccentColor : Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                    }
                    .padding(.horizontal, animate ? 30 : 20)
                    .shadow(
                        color: animate ? secundaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30
                    )
                    .scaleEffect(animate ? 1.1 : 1)
                    .offset(y: animate ? -8 : 0)
                    
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimationOneSecondAfter)
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.5)
    }
    
    /// Performs animate on appear after 1s.
    ///
    ///```
    ///addAnimationOneSecondAfter()
    ///```
    ///
    /// - Complexity: O(1) change the animation value only.
    ///
    private func addAnimationOneSecondAfter() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    NavigationStack {
        EmptyStateView()
            .navigationTitle(Text("Title"))
    }
}
