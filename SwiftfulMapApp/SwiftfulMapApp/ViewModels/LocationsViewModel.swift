//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Leo on 06/05/25.
//

import Foundation

/// A class to provide data access for our tasks.
class LocationsViewModel: ObservableObject {
    @Published var locations: [Location] = []
    
    /// Creates initialization to Locations from LocationsDataService.
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
