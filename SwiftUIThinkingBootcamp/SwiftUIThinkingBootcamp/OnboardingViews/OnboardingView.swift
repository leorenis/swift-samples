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
    @State var onboardingState: Int = SectionOption.welcome.rawValue
    
    // Onboarding inputs
    @State var onboardingName: String = ""
    @State var onboardingAge: CGFloat = 25.0
    @State var onboardingGender: String = ""
    
    // Onboarding alert check
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    // Onboarding App Storage
    @AppStorage(OnboardingStorageKey.onboardingName.rawValue) var currentUserName: String?
    @AppStorage(OnboardingStorageKey.onboardingAge.rawValue) var currentUserAge: Int?
    @AppStorage(OnboardingStorageKey.onboardingGender.rawValue) var currentUserGender: String?
    @AppStorage(OnboardingStorageKey.signedIn.rawValue) var currentUserSignedIn: Bool = false
    
    // Onboarding transitions states
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),  // enter rigth side
        removal: .move(edge: .leading)      // leave left side
    )
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        ZStack {
            // Content
            switch onboardingState {
            case SectionOption.welcome.rawValue:
                welcomeSection
                    .transition(transition)
            case SectionOption.addName.rawValue:
                addNameSection
                    .transition(transition)
            case SectionOption.addAge.rawValue:
                addAgeSection
                    .transition(transition)
            case SectionOption.addGender.rawValue:
                addGenderSection
                    .transition(transition)
            default:
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.purple)
            }
            
            // Buttons
            VStack {
                Spacer()
                bottomButtonLayer
            }
            .padding(32)
        }.alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
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
        Text(getButtonLabel())
            .font(.headline)
            .foregroundStyle(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                handleNextButtonPressed()
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
            
            TextField("Enter your name...", text: $onboardingName)
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
            
            Text(String(format: "%.0f", onboardingAge))
                .font(.body)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Slider(value: $onboardingAge, in: 18...100, step: 1)
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
                Picker(selection: $onboardingGender) {
                    Text("Male").tag("male")
                    Text("Female").tag("female")
                    Text("Non-binary").tag("non-binary")
                } label: {
                    Text("select a gender")
                }
                
            } label: {
                Text(onboardingGender.count > 0 ? "\(onboardingGender)".capitalized : "Select a gender")
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

// MARK: ENUMS
extension OnboardingView {

    /// A enum to provide options key. The main goal is avoid magic constants in the code.
    enum SectionOption: Int {
        case welcome = 0
        case addName = 1
        case addAge = 2
        case addGender = 3
    }
}

// MARK: FUNCTIONS
extension OnboardingView {
    
    /// Handle Onboarding button.
    ///
    /// This function is responsable for manage tap gesture on the footer button on the onboarding screen
    /// ```
    /// handleNextButtonPressed()
    /// ```
    ///
    func handleNextButtonPressed() {
        
        // CHECK INPUTS
        switch onboardingState {
        case SectionOption.addName.rawValue:
            guard onboardingName.count >= 3 else {
                showAlertOnboarding(title: "😩 \nPlease, your name must be at least 3 characters long!")
                return
            }
        case SectionOption.addGender.rawValue:
            guard onboardingGender.count > 1 else {
                showAlertOnboarding(title: "😬 \nPlease, select a gender before moving foward!")
                return
            }
            break
        default:
            break
        }
        
        // GO TO THE NEXT SECTION
        if onboardingState == SectionOption.addGender.rawValue {
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    /// Handle Onboarding alert.
    ///
    /// This function is responsable for manage alerts on the onboarding screen
    /// ```
    /// showAlertOnboarding(title: "Please, enter a value")
    /// ```
    ///
    func showAlertOnboarding(title: String) {
        showAlert.toggle()
        alertTitle = title
    }
    
    /// Handle Onboarding signedIn..
    ///
    /// This function is responsable for manage signedIn on the onboarding screen.
    /// ```
    /// signIn()
    /// ```
    func signIn() {
        currentUserName = onboardingName
        currentUserAge = Int(onboardingAge)
        currentUserGender = onboardingGender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
    
    /// Gets a string with a specified label.
    ///
    /// This function creates and returns an label immediately. The string will have a label based on the onboardingState.
    /// ```
    /// getButtonLabel()
    /// ```
    ///
    /// - Returns: Returs an string with a label:
    ///     - 0:  Sign up;
    ///     - 3: Finish;
    ///     - otherwise: next.
    func getButtonLabel() -> String {
        switch onboardingState {
        case SectionOption.welcome.rawValue: return "Sign up"
        case SectionOption.addGender.rawValue: return "Finish"
        default: return "Next"
        }
    }
}
