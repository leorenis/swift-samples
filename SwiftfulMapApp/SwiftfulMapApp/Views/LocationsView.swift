//
//  ContentView.swift
//  SwiftfulMapApp
//
//  Created by Leo on 05/05/25.
// Episode: https://youtu.be/s4RniydY1xc?list=PLwvDm4Vfkdpha5eVTjLM0eRlJ7-yDDwBk&t=480
//

import SwiftUI
import MapKit

/// A data struct to provide struct to LocationsView.
struct LocationsView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject private var vm: LocationsViewModel
    let maxWidthForIpad: CGFloat = 700
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()

            VStack(spacing: 0) {
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()

                locationsPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

// MARK: EXTENTIONS
extension LocationsView {
    
    /// Map Layer to show Map View.
    private var mapLayer: some View {
        Map(position: $vm.mapPosition) {
            ForEach(vm.locations) { location in
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 8)
                        .onTapGesture {
                            vm.showNextLocation(nextLocation: location)
                        }
                }
            }
        }
    }
    
    /// VStack to make the header view
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading, content: {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    })
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
            }
            .foregroundStyle(.primary)
            
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    /// ZStack to make the locationsPreview view
    private var locationsPreviewStack: some View {
        ZStack {
            // We used ForEach instead directly vm.mapLocation, because we wanna use the transition animation.
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: vm.mapLocation)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad) // adjusts for ipad
                        .frame(maxWidth: .infinity)       // setting new frame for transition. See Nick's explain
                        // We use asymmetric transition when we wanna put some animation on insertion and one another on the removal.
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                }
            }
        }
    }
    
}

// MARK: PREVIEW
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
