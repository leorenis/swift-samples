//
//  IntroView.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 06/04/25.
//

import SwiftUI

/// A enum to provide options key. The main goal is avoid magic constants in the code.
///
enum OnboardingStorageKey: String {
    case signedIn = "signed_in"
    case onboardingName = "onboardingName"
    case onboardingAge = "onboardingAge"
    case onboardingGender = "onboardingGender"
}

/// A class to provide  access for Onboarding Intro View.
///
struct IntroView: View {
    
    // MARK: PROPERTIES
    @AppStorage(OnboardingStorageKey.signedIn.rawValue) var currentUserSignedIn: Bool = false
    
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
            
            if currentUserSignedIn {
                ProfileView()
            } else {
                OnboardingView()
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    IntroView()
}
