//
//  LocationMapAnnotationView.swift
//  SwiftfulMapApp
//
//  Created by Leo on 11/05/25.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    // MARK: PROPERTIES
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        Text("Hello, World!")
    }
}

// MARK: PREVIEW
#Preview {
    LocationMapAnnotationView()
        .environmentObject(LocationsViewModel())
}
