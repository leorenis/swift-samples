//
//  AccessibilityColorsBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 14/07/25.
//  Contrast color checker: https://coolors.co/contrast-checker
//  Other one: https://webaim.org/resources/contrastchecker/
//

import SwiftUI

struct AccessibilityColorsBootcamp: View {
    // MARK: PROPERTIES
    @Environment(\.colorSchemeContrast) var schemeContrast
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors

    var body: some View {
        NavigationStack {
            VStack {
                Button("Button one") {}
                    .foregroundStyle(schemeContrast == .increased ? .white : .primary)
                .buttonStyle(.borderedProminent)
                
                Button("Button one") {}
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(Color.orange)
                
                Button("Button one") {}
                .foregroundStyle(.white)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button("Button one") {}
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(differentiateWithoutColor ? .black : .purple)
            }
            .font(.largeTitle)
            //.navigationTitle("Hi")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
        }
    }
}

// MARK: PREVIEW
#Preview {
    AccessibilityColorsBootcamp()
}
