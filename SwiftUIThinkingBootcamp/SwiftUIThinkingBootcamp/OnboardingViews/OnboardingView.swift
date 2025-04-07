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
    @State var onboardingState: Int = 3
    @State var textFieldName: String = ""
    @State var slideAge: CGFloat = 25
    @State var pickerGender: String = ""
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            // Content
            switch onboardingState {
            case 0:
                welcomeSection
            case 1:
                addNameSection
            case 2:
                addAgeSection
            case 3:
                addGenderSection
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
    /// This is the foreground layer that holds a OnboardingView
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
    
    /// Foreground layer that holds a OnboardingView
    /// This snippet shows welcome section
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
    
    /// Foreground layer that holds a OnboardingView
    /// This snippet shows addName section
    ///
    private var addNameSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            TextField("Enter your name...", text: $textFieldName)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(8)
            
            Spacer()
            Spacer()
        }
        .padding(32)
    }
    
    /// Foreground layer that holds a OnboardingView
    /// This snippet shows add age section
    ///
    private var addAgeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("How old are you?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Text(String(format: "%.0f", slideAge))
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Slider(value: $slideAge, in: 18...100, step: 1)
                .accentColor(.white)
            
            Spacer()
            Spacer()
        }
        .padding(32)
    }
    
    /// Foreground layer that holds a OnboardingView
    /// This snippet shows add gender section
    ///
    private var addGenderSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            // Menu with Picker
            Menu {
                Picker(selection: $pickerGender) {
                    Text("Male").tag("male")
                    Text("Female").tag("female")
                    Text("Non-binary").tag("non-binary")
                } label: {
                    Text("select a gender")
                }
                
            } label: {
                Text(pickerGender.count > 0 ? "\(pickerGender)".capitalized : "Select a gender")
                    .foregroundStyle(.purple)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
            
            Spacer()
            Spacer()
        }
        .padding(32)
    }
}
