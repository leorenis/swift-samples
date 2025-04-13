//
//  Group66Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 13/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing Group.
struct Group66Bootcamp: View {
    var body: some View {
        VStack (spacing: 50) {
            Text("Hello, World!")
            Group {                     // Group these items together. Sounds much more semantic way
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .font(.headline)
            .foregroundStyle(.green)
        }
        .foregroundStyle(.indigo)
        .font(.body)
    }
}


// MARK: PREVIEW
#Preview {
    Group66Bootcamp()
}
