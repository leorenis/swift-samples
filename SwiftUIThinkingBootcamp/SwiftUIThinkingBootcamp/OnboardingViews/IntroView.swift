//
//  IntroView.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 06/04/25.
//

import SwiftUI

/// A class to provide  access for Onboarding Intro View.
///
struct IntroView: View {
    
    // MARK: PROPERTIES
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            // Background
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                center: .topLeading,
                startRadius: 5.0,
                endRadius: UIScreen.main.bounds.height
            )
                .ignoresSafeArea(.all)
            
            // Foreground
        }
    }
}

// MARK: PREVIEW
#Preview {
    IntroView()
}
