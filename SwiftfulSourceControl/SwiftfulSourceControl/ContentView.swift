//
//  ContentView.swift
//  SwiftfulSourceControl
//
//  Created by Leo Renis Santos on 28/04/25.
//

/**
 * Sugestion: Commit messages.
 *
 *  NEW FEATURE:
 *  [Feature] Desciption of the feature.
 *
 *  BUG IN PRODUCTION:
 *  [Patch] Description of patch
 *         Obs: Personal, preffer [Fix].
 *
 *  BUG NOT IN PRODUCTION:
 *  [Bug] Description of the Bug.
 *
 *  MUNDANE TASKS:
 *  [Clean] Description of changes.
 *
 *  RELEASE:
 *  [Release] Description of release.
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundStyle(.tint)
            Text("Git Source Control in Swift!")
                .foregroundStyle(.primary)
            
            Button("Click me") {
                // code here
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
