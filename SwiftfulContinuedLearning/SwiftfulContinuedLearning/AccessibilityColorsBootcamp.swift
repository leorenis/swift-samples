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
    var body: some View {
        VStack {
            Button("Button one") {}
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            
            Button("Button one") {}
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            .tint(Color.orange)
            
            Button("Button one") {}
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            Button("Button one") {}
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
        .font(.largeTitle)
    }
}

#Preview {
    AccessibilityColorsBootcamp()
}
