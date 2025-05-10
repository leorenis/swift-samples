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
        HStack (alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            Spacer()
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

// MARK: EXTENSIONS
extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding(6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    /// VStack to make the titleSection view.
    ///
    private var titleSection: some View {
        VStack (alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    /// Button to make the learnMoreButton view
    ///
    private var learnMoreButton: some View {
        Button {
            
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 36)
        }
        .buttonStyle(.borderedProminent)
    }
    
    /// Button to make the nextButton view
    /// 
    private var nextButton: some View {
        Button {
            
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 36)
        }
        .buttonStyle(.bordered)
    }
}

// MARK: PREVIEW
#Preview {
    ZStack {
        Color.indigo.ignoresSafeArea()
        
        LocationPreviewView(location: LocationsDataService.fallbackLocation)
            .padding()
            
    }.environmentObject(LocationsViewModel())
}
