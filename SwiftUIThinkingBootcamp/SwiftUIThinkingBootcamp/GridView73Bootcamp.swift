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
            // cell(value: 10000000000)
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            GridRow {
                cell(value: 4)
                cell(value: 5)
            }
        }
        
    }
    
    // MARK: FUNCTIONS
    
    /// Gets some view with a styled Text View.
    ///
    /// This function creates and returns a Styled Text View.
    /// ```
    /// cell(value: 1) -> Text("\(value)")
    /// ```
    ///
    /// - Warning: This is a training porpose.
    /// - Parameter Int: This is a number to appear on the cell center.
    /// - Returns: Returs a Text with a number.
    private func cell(value: Int) -> some View {
        Text("\(value)")
            .font(.title)
            .padding()
            .foregroundStyle(.primary)
            .background(Color("AdaptiveColor"))
    }
}

// MARK: PREVIEW
#Preview {
    GridView73Bootcamp()
}
