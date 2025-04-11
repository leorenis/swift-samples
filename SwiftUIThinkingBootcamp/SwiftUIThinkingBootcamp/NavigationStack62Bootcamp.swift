//
//  NavigationStack62Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo 11/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing Navigation Stack.
struct NavigationStack62Bootcamp: View {
    
    // MARK: PROPERTIES
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<10) { index in
                        NavigationLink(destination: MyDetailDestinationView(value: index)) {
                            Text("Click me \(index)")
                        }
                    }
                }
            }
            .navigationTitle("Navigation stack")
        }
    }
}

/// A data struct to provide a view to details.

struct MyDetailDestinationView: View {
    
    // MARK: PROPERTIES
    let value: Int
    
    init (value: Int) {
        self.value = value
        print("SCREEN: \(value)")
    }
    
    var body: some View {
        Text("Detail \(value)")
    }
}
// MARK: PREVIEW
#Preview {
    NavigationStack62Bootcamp()
}
