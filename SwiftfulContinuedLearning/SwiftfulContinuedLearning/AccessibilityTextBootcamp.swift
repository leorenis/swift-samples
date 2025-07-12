//
//  AccessibilityTextBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 11/07/25.
//

import SwiftUI

struct AccessibilityTextBootcamp: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { index in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("Welcome to SwiftUI")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        
                        Text("This is some longer text that expands to multiple lines.")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                    }
                    .background(Color.red)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Accessibility Text")
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}
