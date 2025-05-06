//
//  ContentView.swift
//  SwiftfulMapApp
//
//  Created by Leo on 05/05/25.
//

import SwiftUI

/// A data struct to provide struct to LocationsView.
struct LocationsView: View {
    
    // MARK: PROPERTIES
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

// MARK: PREVIEW
#Preview {
    LocationsView()
}
