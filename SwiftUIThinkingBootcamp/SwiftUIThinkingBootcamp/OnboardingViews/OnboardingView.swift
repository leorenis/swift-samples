//
//  OnboardingView.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 06/04/25.
//

import SwiftUI

/// A class to provide  access for Onboarding View.
///
struct OnboardingView: View {
    // MARK: PROPERTIES
    
    // Onboarding states:
    /**
     * 0 - Welcome screen
     * 1 - Add name
     * 2 - Add Age
     * 3 - Add gender
     */
    @State var onboardingState: Int = 0
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            // Content
            switch onboardingState {
            case 0: welcomeSection
            default:
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.green)
            }
            
            // Buttons
            VStack {
                Spacer()
                bottomButtonLayer
            }
            .padding(32)
        }
    }

}

// MARK: PREVIEW
#Preview {
    OnboardingView()
        .background(Color.purple)
}

// MARK: COMPONENTS
extension OnboardingView {
    /// This is the foreground layer that holds a scrollView
    private var bottomButtonLayer: some View {
        Text("Sign in")
            .font(.headline)
            .foregroundStyle(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                
            }
    }
    
    private var welcomeSection: some View {
       VStack(spacing: 40) {
           Spacer()
            Image(systemName: "heart.text.square.fill")
               .resizable()
               .scaledToFit()
               .frame(width: 200, height: 200)
               .foregroundStyle(.white)
           
           Text("Find your porpuse.")
               .font(.largeTitle)
               .fontWeight(.semibold)
               .foregroundStyle(.white)
               .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundStyle(.white),
                    alignment: .bottom
               )
           
           Text("A purpose is the driving force behind actions and decisions. It’s the reason we do what we do, providing meaning and direction in our lives.")
               .font(.body)
               .fontWeight(.medium)
               .foregroundStyle(.white)
               .multilineTextAlignment(.center)
           
           Spacer()
           Spacer()
        }
       .padding(32)
    }
}
