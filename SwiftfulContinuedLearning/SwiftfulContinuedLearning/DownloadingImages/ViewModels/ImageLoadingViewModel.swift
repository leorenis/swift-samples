//
//  ImageLoadingViewModel.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 09/07/25.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var cancellables: Set<AnyCancellable> = []
    let manager = ThumbnailModelCacheManager.instance
    
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting saved image from cache")
        } else {
            downloadImage()
            print("Downloading new image")
        }
    }
    
    /// Downloads an image asynchronously from the URL specified by `urlString`.
    ///
    /// This method initiates an image download using the Combine framework and sets the result to the `image` property.
    /// It tracks the loading state using the `isLoading` flag and stores the subscription in the `cancellables` set
    /// to maintain its lifecycle.
    ///
    /// Steps involved:
    /// - Sets `isLoading` to `true` to indicate the start of the download.
    /// - Validates and constructs a `URL` from the `urlString` property.
    /// - Uses `URLSession.shared.dataTaskPublisher(for:)` to fetch image data.
    /// - Maps the received `Data` into a `UIImage`.
    /// - Ensures updates to properties happen on the main thread with `receive(on:)`.
    /// - Handles completion and value reception with `sink`.
    /// - Stores the subscription in `cancellables` to keep it alive.
    ///
    /// If the URL is invalid, the method exits early and resets `isLoading` to `false`.
    ///
    /// - Note: The Combine pipeline uses `[weak self]` to prevent strong reference cycles.
    ///
    /// Example usage:
    /// ```swift
    /// viewModel.downloadImage()
    /// ```
    func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                guard
                    let self = self,
                    let image = returnedImage else { return }
                
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)
    }
}
