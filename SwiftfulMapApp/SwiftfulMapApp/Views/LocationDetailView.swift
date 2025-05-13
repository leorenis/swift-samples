//
//  LocationDetailView.swift
//  SwiftfulMapApp
//
//  Created by Leo on 13/05/25.
//

import SwiftUI

/// A data struct to provide  LocationDetailView.
struct LocationDetailView: View {
    
    // MARK: PROPERTIES
    let location: Location
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        ScrollView {
            VStack {
                TabView {
                    ForEach(location.imageNames, id: \.self) {
                        Image($0)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .clipped()
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle())
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: PREVIEW
#Preview {
    LocationDetailView(location: LocationsDataService.fallbackLocation)
}
