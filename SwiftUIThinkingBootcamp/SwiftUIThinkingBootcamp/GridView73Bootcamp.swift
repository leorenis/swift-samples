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
    
    private let dimensions: Int = 4
    
    // MARK: BODY VIEW
    var body: some View {
        
        // Shows Grid Rows sample
        // showGridRowsSample
        // showGridRowsAndcolumnsSample
        showCellColumnsGridLayoutSample
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

// MARK: EXTENSIONS

extension GridView73Bootcamp {
    
    /// View to Show first exemple, using Grid and Rows
    ///
    var showGridRowsSample: some View {
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
    
    /// View to show grid contain rows and cols
    ///
    var showGridRowsAndcolumnsSample: some View {
        Grid(alignment: .center) {
            ForEach (0..<dimensions, id: \.self) { row in
                GridRow {
                    ForEach (0..<dimensions, id: \.self) { column in
                        let cellNumber = (row * dimensions) + (column + 1)
                        cell(value: cellNumber)
                    }
                }
            }
        }
    }
    
    /// View to show grid contain rows and cols creating a modern Grid Layout
    ///  Inspired by @BigMtnStudio
    ///  https://x.com/BigMtnStudio/status/1750486218901467163/photo/1
    ///  iOS 16+
    ///
    var showCellColumnsGridLayoutSample: some View {
        Grid {
            GridRow {
                Color.green.opacity(0.5)
                    .gridCellColumns(3)
            }
            
            GridRow {
                Color.blue.opacity(0.5)
                Color.red.opacity(0.5).gridCellColumns(2)
            }
            
            GridRow {
                Color.blue.opacity(0.5)
                Color.orange.opacity(0.5)
                Color.red.opacity(0.5)
            }
            
            GridRow {
                Color.orange.opacity(0.5)
                    .gridCellColumns(2)
                
                Color.red.opacity(0.5)
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    GridView73Bootcamp()
}
