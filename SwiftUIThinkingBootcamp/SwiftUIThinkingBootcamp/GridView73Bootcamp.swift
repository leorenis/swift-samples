//
//  GridView73Bootcamp.swift
//  SwiftUIThinkingBootcamp
//  Episode: https://youtu.be/LnPMsG0sV50?si=7kqPoMbY-HLpCrNP
//
//  Created by Leo on 19/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing GridView iOS 16+.
struct GridView73Bootcamp: View {
    var body: some View {
        Grid {
            GridRow {
                cell(value: 1)
                cell(value: 2)
                cell(value: 3)
            }
            GridRow {
                cell(value: 4)
                cell(value: 5)
            }
        }
    }
    
    // MARK: FUNCTIONS
    
    
    private func cell(value: Int) -> some View {
        Text("\(value)")
            .font(.title)
            .padding()
            .foregroundStyle(.white)
            .background(Color.blue)
    }
}

// MARK: PREVIEW
#Preview {
    GridView73Bootcamp()
}
