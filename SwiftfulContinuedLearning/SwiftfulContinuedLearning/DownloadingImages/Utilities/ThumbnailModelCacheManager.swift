//
//  ThumbnailModelCacheManager.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 10/07/25.
//

import Foundation
import SwiftUI

/// A singleton manager responsible for caching thumbnail images in memory.
///
/// `ThumbnailModelCacheManager` uses `NSCache` to store `UIImage` objects associated with string keys.
/// This improves performance by avoiding redundant network requests for images that have already been fetched.
/// Conforms to `ImageCacheable` for use as a pluggable image caching strategy.
///
/// The cache has a limit of 100 images or 10 MB in total size to help control memory usage.
class ThumbnailModelCacheManager: ImageCacheable {
    
    /// The shared singleton instance of `ThumbnailModelCacheManager`.
    ///
    /// Access this instance to add or retrieve images from the centralized thumbnail cache.
    static let instance = ThumbnailModelCacheManager()
    
    /// Private initializer to enforce the singleton pattern.
    private init() {}
    
    /// The in-memory image cache used to store thumbnail images.
    ///
    /// - `countLimit`: Maximum number of items allowed (100).
    /// - `totalCostLimit`: Maximum memory usage in bytes (10 MB).
    var thumbnailCache: NSCache<NSString, UIImage> = {
       var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 10 * 1024 * 1024 // 10MB
        return cache
    }()
    
    /// Adds a `UIImage` to the cache for the given key.
    /// - Parameters:
    ///   - key: A unique string identifier for the image.
    ///   - value: The `UIImage` to store in the cache.
    ///
    /// ```swift
    /// cacheManager.add(key: "product-123", value: image)
    /// ```
    func add(key: String, value: UIImage) {
        thumbnailCache.setObject(value, forKey: key as NSString)
    }
    
    /// Retrieves a cached `UIImage` for the specified key.
    /// - Parameter key: The string identifier used when the image was cached.
    /// - Returns: The cached `UIImage` if it exists, or `nil` if not found.
    ///
    /// ```swift
    /// let image = cacheManager.get(key: "123")
    /// ```
    func get(key: String) -> UIImage? {
        return thumbnailCache.object(forKey: key as NSString)
    }
}
