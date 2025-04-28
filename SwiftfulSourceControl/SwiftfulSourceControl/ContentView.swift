//
//  ContentView.swift
//  SwiftfulSourceControl
//
//  Created by Leo Renis Santos on 28/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundStyle(.tint)
            Text("Git Source Control in Swift!")
                .foregroundStyle(.primary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
