//
//  ThumbnailModelFileManager.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 10/07/25.
//

import Foundation
import SwiftUI

/// A singleton class that manages saving and retrieving thumbnail images from the file system.
///
/// `ThumbnailModelFileManager` stores thumbnails in the app's cache directory under a custom folder.
/// It provides disk-based persistence for images, reducing memory pressure and avoiding repeated network downloads.
///
/// Images are saved in PNG format with a `.png` extension, and stored using a string `key` for identification.
class ThumbnailModelFileManager {
    
    /// The shared singleton instance of `ThumbnailModelFileManager`.
    static let instance = ThumbnailModelFileManager()
    
    /// The name of the folder in the cache directory where thumbnails are stored.
    let folderName = "downloaded_thumbnails"
    
    /// The file extension used for all stored images.
    let thumbExtension = ".png"
    
    /// Private initializer to enforce singleton pattern and ensure the storage folder is created.
    private init() {
        createFolderIfNeeded()
    }

    /// Creates the folder used for storing image files, if it doesn't already exist.
    ///
    /// This method uses the `FileManager` to create the folder inside the user's cache directory.
    /// It ensures that images can be saved to and retrieved from disk.
    private func createFolderIfNeeded() {
        guard let url = getFolderPath() else { return }
        let filePath = url.path(percentEncoded: false)
        if !FileManager.default.fileExists(atPath: filePath) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                print("Folder created successfully!")
            } catch let error {
                print("Error creating folder: \(error)")
            }
        }
    }
    
    /// Returns the URL to the custom folder inside the cache directory.
    ///
    /// - Returns: The full path to the thumbnail storage folder, or `nil` if it cannot be determined.
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    
    /// Constructs the full file path for a given key (used as filename).
    ///
    /// - Parameter key: The unique key identifying the image.
    /// - Returns: The full file URL for the image, or `nil` if the base folder path is unavailable.
    private func getImagePath(for key: String) -> URL? {
        guard let folderURL = getFolderPath() else { return nil }
        return folderURL.appendingPathComponent(key + thumbExtension)
    }
    
    /// Saves a `UIImage` to disk with the given key.
    ///
    /// - Parameters:
    ///   - key: The unique identifier for the image
    ///   - value: The `UIImage` to be stored.
    ///
    /// The image is encoded as PNG and stored at the generated file path. If encoding or writing fails, the error is printed to the console.
    func add(key: String, value: UIImage) {
        guard
            let data = value.pngData(),
            let url = getImagePath(for: key) else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving to file manager: \(error)")
        }
    }
    
    /// Retrieves a cached image from disk for a given key.
    ///
    /// - Parameter key: The unique identifier for the image.
    /// - Returns: The `UIImage` if it exists on disk, or `nil` otherwise.
    func get(key: String) -> UIImage? {
        guard
            let url = getImagePath(for: key),
            FileManager.default.fileExists(atPath: url.path(percentEncoded: false)) else { return nil }
        return UIImage(contentsOfFile: url.path(percentEncoded: false))
    }
}
