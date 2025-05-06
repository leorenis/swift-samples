//
//  ContentView.swift
//  SwiftfulMapApp
//
//  Created by Leo on 05/05/25.
//

import SwiftUI

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location] = []
    
    /// Creates initialization to Locations from LocationsDataService.
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}

/// A data struct to provide struct to LocationsView.
struct LocationsView: View {
    
    // MARK: PROPERTIES
    @StateObject private var vm = LocationsViewModel()
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        VStack {
            List {
                ForEach(vm.locations, id: \.id) { location in
                    Text("\(location.name)")
                }
            }
        }
        .padding()
    }
}

// MARK: PREVIEW
#Preview {
    LocationsView()
}
