//
//  HapticsBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 29/05/25.
//

import SwiftUI

/// Class v is a Singleton responsible for manager haptics in our App.
class HapticsManager {
    
    private init() {} // As a singleton, its must not be initialized out of this class.
    
    // MARK: PROPERTIES
    static let instance = HapticsManager() // Singleton
    
    // MARK: ENUM
    
    // MARK: FUNCTIONS
    
    /// Perform notification in a singleton instance.
    ///
    /// Performs notification in a singleton instance of HapticsManager.
    ///
    /// - Parameters:
    ///    - type: FeedbackType
    ///
    /// ```
    ///     notification(type: .success)
    /// ```
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    /// Perform impact in a singleton instance.
    ///
    /// Performs impact in a singleton instance of HapticsManager.
    ///
    /// ```
    ///     impact(style: .light)
    /// ```
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
/// Struct used to training how to create Haptics vibrations.
struct HapticsBootcamp: View {
    // MARK: BODY
    var body: some View {
        Text("Hello, Haptics!")
    }
}

// MARK: PREVIEW
#Preview {
    HapticsBootcamp()
}
