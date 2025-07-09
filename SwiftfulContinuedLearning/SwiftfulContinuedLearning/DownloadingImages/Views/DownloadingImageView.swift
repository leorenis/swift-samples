//
//  DownloadingImageView.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 09/07/25.
//

import SwiftUI

struct DownloadingImageView: View {
    // MARK: PROPERTIES
    @StateObject private var loader: ImageLoadingViewModel
    
    /// Initializes a new instance of the view with a specified image URL string.
    ///
    /// This initializer creates and assigns a `StateObject` that wraps an
    /// `ImageLoadingViewModel`, which handles loading an image from the given URL.
    ///
    /// - Parameter url: The URL string used by the image loading view model to fetch the image.
    init(url: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url))
    }
    
    var body: some View {
        if loader.isLoading {
            ProgressView()
        } else if let image = loader.image {
            Image(uiImage: image)
                .resizable()
                .clipShape(Circle())
        }
    }
}

#Preview(traits: .sizeThatFitsLayout, body: {
    DownloadingImageView(url: "https://cdn.dummyjson.com/product-images/groceries/apple/thumbnail.webp")
        .frame(width: 75, height: 75)
})
