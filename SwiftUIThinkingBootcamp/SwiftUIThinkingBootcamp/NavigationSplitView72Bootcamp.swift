//
//  NavigationSplitView72Bootcamp.swift
//  SwiftUIThinkingBootcamp
//  Episode: https://youtu.be/Ua37Oof6H1Q?si=GAgopSZnqJ96mkm2
//  Created by Leo on 16/04/25.
//
// NavigationSplitView -> iPad, MacOS, VisionOS

import SwiftUI

/// A data struct to provide struct to practicing NavigationSplitView.
struct NavigationSplitView72Bootcamp: View {
    
    // MARK: PROPERTIES
    @State private var visibility: NavigationSplitViewVisibility = .all
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $visibility) {
            List {
                ForEach(FoodCategory.allCases, id: \.self) { category in
                    Text(category.rawValue.capitalized)
                }
            }
            .navigationTitle("All categories")
        } content: {
            Color.blue
        }
        detail: {
            Color.green
        }
        .navigationSplitViewStyle(.prominentDetail)
        
    }
}

// MARK: PREVIEW
#Preview {
    NavigationSplitView72Bootcamp()
}

/// A enum to provide options key. The main goal is avoid magic constants in the code.
///
enum FoodCategory: String, CaseIterable {
    case fruits, vegetables, meats
}
