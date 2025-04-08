//
//  AsyncImageBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 08/04/25.
//

import SwiftUI

let URL_IMAGE = "https://picsum.photos/200"

/// A class to provide  access for AsyncImageBootcamp View.
///
struct AsyncImageBootcamp: View {
    
    // MARK: PROPERTIES
    let url = URL(string: URL_IMAGE)
    
    /// View Body: block  responsable for acts as entry point in this view.
    var body: some View {
        // ImageLoadingView()
        ImagePhaseView()
    }
}


// MARK: PREVIEW
#Preview {
    AsyncImageBootcamp()
}

// MARK: VIEWS
/// A class to provide  access for ImageLoadingView.
///
struct ImageLoadingView: View {
    var body: some View {
        AsyncImage(url: URL(string: URL_IMAGE), content: { returnedImage  in
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

struct ImagePhaseView: View {
    var body: some View {
        AsyncImage(url: URL(string: URL_IMAGE)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .failure(_):
                Image(systemName: "questionmark")
                    .font(.headline)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
    }
}
