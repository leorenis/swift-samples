//
//  Observable76Bootcamp.swift
//  SwiftUIThinkingBootcamp
//  Episode: https://youtu.be/hLkTMJ_SFzY?si=Be_YAvY4VZpenBMr
//  Article: https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro
//
//  Created by Leo on 21/04/25.
//

import SwiftUI

class ObservableViewModel: ObservableObject {
    @Published var title: String = "Morning"
}

/// A data struct to provide struct to practicing Observable.
struct Observable76Bootcamp: View {
    
    // MARK: PROPERTIES
    @StateObject private var viewModel: ObservableViewModel = ObservableViewModel()
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        VStack(spacing: 20) {
            Button(viewModel.title) {
                viewModel.title = "Morning..."
            }
            
            GreetingsObserbableView(viewModel: viewModel)
        }
    }
}

/// A data struct to provide struct to practicing Observable.
struct GreetingsObserbableView: View {
    // MARK: PROPERTIES
    @ObservedObject var viewModel: ObservableViewModel
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Morning greeting"
        }
    }
}


// MARK: PREVIEW
#Preview {
    Observable76Bootcamp()
}
