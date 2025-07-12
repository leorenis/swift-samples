//
//  AccessibilityTextBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 11/07/25.
//

import SwiftUI

struct AccessibilityTextBootcamp: View {
    // MARK: PROPERTIES
    @Environment(\.dynamicTypeSize) var sizeCategory
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
//                                .font(.system(size: 18)) // Define a specific size. Do not resize
                            
                            Text("Welcome to SwiftUI")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        
                        Text("This is some longer text that expands to multiple lines.")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor) // Wooow
                    }
                    //.frame(height: 100)
                    .background(Color.purple.opacity(0.3))
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Accessibility Text")
        }
    }
}

extension DynamicTypeSize {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            return 1
        case .large, .xLarge, .xxLarge:
            return 0.8
        default :
            return 0.6
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}
