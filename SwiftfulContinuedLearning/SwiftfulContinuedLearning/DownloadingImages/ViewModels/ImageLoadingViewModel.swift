//
//  ImageLoadingViewModel.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 09/07/25.
//

import Foundation
import SwiftUI
import Combine

/// A view model responsible for asynchronously loading and caching images.
///
/// `ImageLoadingViewModel` provides functionality to retrieve an image either from a local cache or by downloading
/// it from a remote URL. It uses Combine for handling asynchronous network operations and SwiftUI's
/// `@Published` properties for reactive UI updates.
///
/// The image is first searched in a cache (via `ThumbnailModelFileManager`). If not found, it downloads the image
/// and caches it for future use. The view model also maintains a loading state to indicate whether an image
/// is currently being fetched.
///
/// This class is designed to be used in SwiftUI views where image loading needs to be asynchronous,
/// cached, and observable.
class ImageLoadingViewModel: ObservableObject {
    /// The loaded image. This is published so the UI can reactively update.
    @Published var image: UIImage? = nil
    
    /// A flag indicating whether an image is currently being downloaded.
    @Published var isLoading: Bool = false
    
    /// A set to store Combine subscriptions to keep them alive.
    var cancellables: Set<AnyCancellable> = []
    
    /// A singleton manager responsible for saving and retrieving cached images.
    let manager = ThumbnailModelFileManager.instance
    
    /// The remote URL (as a string) to download the image from.
    let urlString: String
    
    /// A unique key used to store and retrieve the image from cache.
    let imageKey: String
    
    /// Initializes the view model with a given URL and cache key.
    /// - Parameters:
    ///   - url: The string representation of the remote image URL.
    ///   - key: The unique key to identify and store the image in cache.
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    /// Retrieves an image from cache or downloads it if not available.
    ///
    /// This method first attempts to retrieve a previously cached image using the `imageKey`.
    /// If a cached image is found, it sets it to the `image` property and logs the cache retrieval.
    /// If no cached image is available, it initiates an asynchronous image download by calling `downloadImage()`.
    ///
    /// Steps involved:
    /// - Attempts to get the image from the cache using `manager.get(key:)`.
    /// - If a cached image exists:
    ///   - Assigns it to the `image` property.
    ///   - Logs the use of the cached image.
    /// - If not:
    ///   - Calls `downloadImage()` to fetch the image from the remote URL.
    ///   - Logs that the image is being downloaded.
    ///
    /// - Note: The actual download and caching logic is handled in the `downloadImage()` method.
    ///
    /// Example usage:
    /// ```swift
    /// getImage()
    /// ```
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
    /// - Note: The Combine pipeline uses `[weak self]` to prevent strong reference cycles and prevent memory leaks.
    ///
    /// Example usage:
    /// ```swift
    /// downloadImage()
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
