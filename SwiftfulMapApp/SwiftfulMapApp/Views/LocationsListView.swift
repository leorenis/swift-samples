//
//  LocationsListView.swift
//  SwiftfulMapApp
//
//  Created by Leo 08/05/25.
//

import SwiftUI

struct LocationsListView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                listViewRow(location: location)
            }
            .padding(.vertical, 4)
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
    }
}

extension LocationsListView {
    private func listViewRow(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                
                Text(location.cityName)
                    .font(.subheadline)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// MARK: PREVIEW
#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
