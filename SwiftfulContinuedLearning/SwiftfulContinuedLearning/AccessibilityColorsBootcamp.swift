//
//  AccessibilityColorsBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo Renis Santos on 14/07/25.
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
