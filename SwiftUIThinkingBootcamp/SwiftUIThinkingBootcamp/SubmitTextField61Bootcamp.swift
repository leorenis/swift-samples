//
//  SubmitTextField61Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 09/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing SubmitTextField.
struct SubmitTextField61Bootcamp: View {
    
    // MARK: PROPERTIES
    @State private var text: String = ""
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        VStack {
            TextField("Placeholder 1 route", text: $text)
                .submitLabel(.route)
                .onSubmit {
                    print("Text field .route.")
                }
            
            TextField("Placeholder 2 .next", text: $text)
                .submitLabel(.next)
                .onSubmit {
                    print("Placeholder 2 .next")
                }
            
            TextField("Placeholder 3 .search", text: $text)
                .submitLabel(.search)
                .onSubmit {
                    print("Placeholder 3 .search")
                }
        }
    }
}

// MARK: PREVIEW
#Preview {
    SubmitTextField61Bootcamp()
}
