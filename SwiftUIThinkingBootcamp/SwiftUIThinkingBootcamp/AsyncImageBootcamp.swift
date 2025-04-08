//
//  AsyncImageBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 08/04/25.
//

import SwiftUI

/// A class to provide  access for Onboarding Intro View.
///
struct AsyncImageBootcamp: View {
    
    // MARK: PROPERTIES
    let url = URL(string: "https://picsum.photos/200")
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        AsyncImage(url: url, content: { returnedImage  in
            returnedImage
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
        }, placeholder: {
            ProgressView()
        })
    }
}
// MARK: PREVIEW
#Preview {
    AsyncImageBootcamp()
}
