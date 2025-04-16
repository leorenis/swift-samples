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
    
    var body: some View {
        
        NavigationSplitView {
            Color.red
        } content: {
            Color.blue
        }
        detail: {
            Color.green
        }

        
    }
}

// MARK: PREVIEW
#Preview {
    NavigationSplitView72Bootcamp()
}
