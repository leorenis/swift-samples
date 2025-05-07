//
//  ContentView.swift
//  SwiftfulMapApp
//
//  Created by Leo on 05/05/25.
//

import SwiftUI
import MapKit

/// A data struct to provide struct to LocationsView.
struct LocationsView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject private var vm: LocationsViewModel
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            Map(position: $vm.mapPosition)
                .ignoresSafeArea()
            
            VStack {
                header
                    .padding()
                Spacer()
            }
        }
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.thinMaterial)
                .overlay(alignment: .leading, content: {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .padding()
                        
                })
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        }
    }
}

// MARK: PREVIEW
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
