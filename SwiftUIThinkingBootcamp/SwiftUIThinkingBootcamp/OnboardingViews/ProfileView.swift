//
//  ProfileView.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 07/04/25.
//

import SwiftUI

/// A class to provide  access for Onboarding View.
struct ProfileView: View {
    
    // MARK: PROPERTIES
    
    // Onboarding App Storage
    @AppStorage(OnboardingStorageKey.onboardingName.rawValue) var currentUserName: String?
    @AppStorage(OnboardingStorageKey.onboardingAge.rawValue) var currentUserAge: Int?
    @AppStorage(OnboardingStorageKey.onboardingGender.rawValue) var currentUserGender: String?
    @AppStorage(OnboardingStorageKey.signedIn.rawValue) var currentUserSignedIn: Bool = false
    
    // Profile transitions states
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .bottom),    // enter bottom
        removal: .move(edge: .top)          // leave top
    )

    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            profileSection
                .transition(transition)
        }
    }
}

// MARK: PREVIEW
#Preview {
    ProfileView()
}

// MARK: COMPONENTS
extension ProfileView {
    var profileSection: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text(currentUserName ?? "Your name here")
            Text("This user is \(currentUserAge ?? 0 ) years old!")
            Text("Their gender is \(currentUserGender ?? "unknown")")
                .padding(.bottom, 12)
            
            Text("Sign out")
                .foregroundStyle(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }
        }
        .font(.title)
        .foregroundColor(.purple)
        .padding()
        .padding(.vertical, 40)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(32)
    }
}

// MARK: FUNCTIONS
extension ProfileView {
    /// Handle Onboarding signOut.
    ///
    /// This function is responsable for manage signOut on the profile screen.
    /// ```
    /// signOut()
    /// ```
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}
