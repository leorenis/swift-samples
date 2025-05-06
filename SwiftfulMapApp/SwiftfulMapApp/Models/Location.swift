//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by Leo on 05/05/25.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}

