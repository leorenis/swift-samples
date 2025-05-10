//
//  LocationPreviewView.swift
//  SwiftfulMapApp
//
//  Created by Leo on 10/05/25.
//

import SwiftUI

struct LocationPreviewView: View {
    
    // MARK: PROPERTIES
    let location: Location
    
    var body: some View {
        VStack(spacing: 16.0) {
            imageSection
            titleSection
        }
    }
}

// MARK: EXTENSIONS

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding(6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var titleSection: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
    }
}

// MARK: PREVIEW
#Preview {
    ZStack {
        Color.indigo
            .ignoresSafeArea(edges: .all)
        
        LocationPreviewView(location: LocationsDataService.fallbackLocation)
    }
}
