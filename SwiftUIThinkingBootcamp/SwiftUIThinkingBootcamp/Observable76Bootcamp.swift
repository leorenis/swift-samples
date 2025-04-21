//
//  Observable76Bootcamp.swift
//  SwiftUIThinkingBootcamp
//  Episode: https://youtu.be/hLkTMJ_SFzY?si=Be_YAvY4VZpenBMr
//  Article: https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro
//
//  Created by Leo on 21/04/25.
//

import SwiftUI
/**
 * Refactoring:
 *  - 1. Remove ObservableObject and add @Observable;
 *  - 2. Remove the @Published;
 *  - 3. Change FROM @StateObject TO @State;
 *  - 4. Change FROM @ObservedObject TO @Bindable;
 *  - 5. Change FROM environmentObject TO environment
 *  - 6. Change FROM @EnvironmentObject TO @Environment(ObservableViewModel.self)
 *
 *  We will learn more about this in https://www.youtube.com/playlist?list=PLwvDm4Vfkdphr2Dl4sY4rS9PLzPdyi8PM
 *  */

@Observable class ObservableViewModel {
    var title: String = "Greetings!" // Will be published
    @ObservationIgnored var internalValue: Int = 0 // Only to know! Will not be published
}

/// A data struct to provide struct to practicing Observable.
struct Observable76Bootcamp: View {
    
    // MARK: PROPERTIES
    @State private var viewModel: ObservableViewModel = ObservableViewModel()
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        VStack(spacing: 20) {
            Button(viewModel.title) {
                viewModel.title = "Greetings..."
            }
            
            GreetingsObserbableView(viewModel: viewModel)
            GreetingsEnvironmentView()
        }
        .environment(viewModel)
    }
}

/// A data struct to provide struct to practicing Observable from @ObservedObject.
struct GreetingsObserbableView: View {
    // MARK: PROPERTIES
    @Bindable var viewModel: ObservableViewModel
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Greeting observed object"
        }
    }
}

/// A data struct to provide struct to practicing Observable from @Environment.
struct GreetingsEnvironmentView: View {
    
    // MARK: PROPERTIES
    @Environment(ObservableViewModel.self) var viewModel
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Greeting environment object"
        }
    }
}


// MARK: PREVIEW
#Preview {
    Observable76Bootcamp()
}
