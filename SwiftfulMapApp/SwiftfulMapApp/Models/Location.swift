//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by Leo on 05/05/25.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // We do not use UUID().uuidString() because in this specific case, we should not have same location name for same city.
    var id: String {
        // name     = Coleseum
        // cityName = Rome
        // id       = ColeseumRome
        name + cityName
    }
}

