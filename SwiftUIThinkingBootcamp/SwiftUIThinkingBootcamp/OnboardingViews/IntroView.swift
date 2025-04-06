//
//  IntroView.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 06/04/25.
//

import SwiftUI

/// A enum to provide options key. The main goal is avoid magic constants in the code.
///
enum OnboardingStorageKey {
    case signedIn
    
    var key: String {
        switch self {
        case .signedIn: return "signed_in"
        }
    }
}

/// A class to provide  access for Onboarding Intro View.
///
struct IntroView: View {
    
    // MARK: PROPERTIES
    @AppStorage(OnboardingStorageKey.signedIn.key) var currentUserSignedIn: Bool = false
    
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
                Text("Profile View")
            } else {
                Text("Onboarding View")
            }
            
            // if user is signed in: profile view
            // else onboarding view
            
            
        }
    }
}

// MARK: PREVIEW
#Preview {
    IntroView()
}
