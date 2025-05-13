//
//  LocationDetailView.swift
//  SwiftfulMapApp
//
//  Created by Leo on 13/05/25.
//

import SwiftUI
import MapKit

/// A data struct to provide  LocationDetailView.
struct LocationDetailView: View {
    
    // MARK: PROPERTIES
    let location: Location
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
    }
}

// MARK: EXTENSIONS
extension LocationDetailView {
    /// TabView to show images section.
    private var imageSection: some View {
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
    
    /// VStack to show title section.
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    /// VStack to show description section.
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read more", destination: url)
                    .font(.headline)
                    .tint(Color.blue)
            }
        }
    }
    
    /// Map Layer to show Map View.
    private var mapLayer: some View {
        Map(position: .constant(.region(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )))) {
            Annotation(location.name, coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false) // Disables gesture.
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    /// Button layer to show back option button
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
        }
        .font(.headline)
        .padding(16)
        .foregroundStyle(.primary)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
        .padding()

    }
}

// MARK: PREVIEW
#Preview {
    LocationDetailView(location: LocationsDataService.fallbackLocation)
        .environmentObject(LocationsViewModel())
}
