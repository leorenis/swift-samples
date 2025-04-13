//
//  SafeAreaInset65Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 13/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing SafeAreaInset.
struct SafeAreaInset65Bootcamp: View {
    // MARK: PROPERTIES
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe area insets")
//            .overlay(
//                Text("Hello, World!")
//                    .frame(maxWidth: .infinity)
//                    .background(Color.yellow)
//                , alignment: .bottom
//            )
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: nil) { // The right way
                Text("Hello, We're using safeAreaInset!")
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
            }
            .safeAreaInset(edge: .top, alignment: .trailing, spacing: nil) {
                Text("Hi")
                    .padding()
                    .background(Color.indigo)
                    .clipShape(Circle())
                    .padding()
                    .foregroundStyle(.white)
                    
            }
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .top, alignment: .center, spacing: nil) {
                Text("Hello, We're using safeAreaInset!")
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.background(ignoresSafeAreaEdges: .bottom))
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    SafeAreaInset65Bootcamp()
}
