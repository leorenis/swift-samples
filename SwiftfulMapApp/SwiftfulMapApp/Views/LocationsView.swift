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
    @EnvironmentObject private var vm: LocationsViewModel
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        VStack {
            List {
                ForEach(vm.locations) {
                    Text($0.name)
                }
            }
        }
        .padding()
    }
}

// MARK: PREVIEW
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
