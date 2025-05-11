//
//  LocationMapAnnotationView.swift
//  SwiftfulMapApp
//
//  Created by Leo on 11/05/25.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    // MARK: PROPERTIES
    let accentColor = Color.accentColor
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        VStack (spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .font(.headline)
                .foregroundColor(.white)
                .padding(8)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .foregroundColor(accentColor)
                .rotationEffect(.degrees(180))
                .offset(y: -3)
                .padding(.bottom, 8)
        }
    }
}

// MARK: PREVIEW
#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        LocationMapAnnotationView()
            .environmentObject(LocationsViewModel())
    }
}
