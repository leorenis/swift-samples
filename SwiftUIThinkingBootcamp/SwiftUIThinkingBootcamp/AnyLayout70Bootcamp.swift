//
//  AnyLayout70Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
// References: https://useyourloaf.com/blog/size-classes
// Episode: https://youtu.be/7BAW70amSCA?si=YWX5ol0bNKprVn0M
//  Created by Leo on 16/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing AnyLayout.
struct AnyLayout70Bootcamp: View {
    // MARK: PROPERTIES
    
    /**
     * Using theses Environments bellow, Apple gonna tell us if the screen orientation is: Regular or Compact.
     */
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        VStack {
            Text("Horizontal: \(horizontalSizeClass.debugDescription)")
            Text("Vertical: \(verticalSizeClass.debugDescription)")
        }
        
        if horizontalSizeClass == .compact {
            VStack {
                Text("Alpha")
                Text("Beta")
                Text("Gamma")
            }
        }
        else {
            HStack {
                Text("Alpha")
                Text("Beta")
                Text("Gamma")
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    AnyLayout70Bootcamp()
}
