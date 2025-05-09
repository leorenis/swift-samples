//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by Leo on 05/05/25.
//



import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    /// We do not use UUID().uuidString() because in this specific case, we should not have same location name for same city.
    /// Identifiable
    var id: String {
        // name     = Coleseum
        // cityName = Rome
        // id       = ColeseumRome
        name + cityName
    }
    
    /// Equatable
    /// Equatable is similar to equals hashcode in another languages.
    /// lhs: Left Hand Side
    /// rhs: right Hand Side
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

