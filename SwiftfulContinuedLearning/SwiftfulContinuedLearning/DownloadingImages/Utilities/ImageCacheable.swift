//
//  ImageCacheable.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 12/07/25.
//

import Foundation
import SwiftUI

/// A protocol defining a common interface for image caching mechanisms.
///
/// `ImageCacheable` allows any conforming type—such as memory-based or file-based caches—to implement
/// consistent behavior for storing and retrieving `UIImage` instances using a string-based key.
///
/// This abstraction enables interchangeable use of different caching strategies (e.g., in-memory, disk, hybrid),
/// promoting clean architecture, testability, and flexibility.
protocol ImageCacheable {
    
    /// Saves a `UIImage` to disk with the given key.
    /// - Parameters:
    ///   - key: The unique identifier for the image
    ///   - value: The `UIImage` to be stored.
    func add(key: String, value: UIImage)
    
    /// Retrieves a cached image from disk for a given key.
    /// - Parameter key: The string identifier used when the image was cached.
    /// - Returns: The cached `UIImage` if it exists, or `nil` if not found.
    func get(key: String) -> UIImage?
}
