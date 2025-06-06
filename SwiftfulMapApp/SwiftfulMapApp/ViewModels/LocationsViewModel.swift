//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Leo on 06/05/25.
//

import Foundation
import SwiftUI
import MapKit

/// A class to provide data access for our tasks.
class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location] = []
    
    // Current location on the map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapPosition: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // show list of locations
    @Published var showLocationsList: Bool = false
    
    // show location details via sheet
    @Published var sheetLocation: Location? = nil
    
    /// Creates initialization to Locations from LocationsDataService.
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = LocationsDataService.fallbackLocation
        self.updateMapRegion(location: LocationsDataService.fallbackLocation)
    }
    
    /// Performs update map region method in mapRegion.
    ///
    /// This change current location on screen to the next one.
    ///
    ///```
    ///updateMapRegion(location)
    ///```
    /// - Parameters:
    ///    - location : this is the Location
    ///
    /// - Complexity: O(*1*) where *1* is the location to set.
    ///
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapPosition = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: mapSpan
                )
            )
        }
    }
    
    /// Performs toggle showlocationsList
    ///
    ///```
    ///toggleLocationsList(location)
    ///```
    ///
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    /// Performs toggle showNextLocation
    ///
    ///```
    ///showNextLocation(nextLocation)
    ///```
    ///
    /// - Parameters:
    ///    - location : this is a Location
    ///
    func showNextLocation(nextLocation: Location) {
        withAnimation (.easeInOut){
            mapLocation = nextLocation
            showLocationsList = false
        }
    }
    
    /// Performs update Location to next index.
    ///
    /// This function try to find next index in locations array, when find it, call function showNextLocation passing the next.
    /// Otherwise, return first location.
    ///
    ///```
    ///nextButtonPressed()
    ///```
    /// - Complexity: O(*n*) where *n* is the index to be found.
    func nextButtonPressed() {
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation}) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
        
        // Check if the nextIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid. Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(nextLocation: firstLocation)
            return
        }
        
        // Next index IS valid
        showNextLocation(nextLocation: locations[nextIndex])
    }
}
