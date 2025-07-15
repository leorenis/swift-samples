//
//  AccessibilityVoiceOverBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 14/07/25.
//

import SwiftUI

struct AccessibilityVoiceOverBootcamp: View {
    // MARK: PROPERTIES
    @State private var isActive = false
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    
                }
            }
        }
    }
}

#Preview {
    AccessibilityVoiceOverBootcamp()
}
