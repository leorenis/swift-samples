//
//  ContentUnavailableView74Bootcamp.swift
//  SwiftUIThinkingBootcamp
//  Episode: https://youtu.be/wfJENH5kfeo?si=XtBn_76ZBLlhuJCh
//
//  Created by Leo on 19/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing ContentUnavailableView iOS 17+.
struct ContentUnavailableView74Bootcamp: View {
    var body: some View {
        
        /// Checks for iOS 17+
        if #available(iOS 17.0, *) {
            ContentUnavailableView(
                "Empty state",
                systemImage: "magnifyingglass",
                description: Text("Content not found!")
            )
        }
    }
}


// MARK: PREVIEW
#Preview {
    ContentUnavailableView74Bootcamp()
}
