//
//  ThumbnailModelFileManager.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 10/07/25.
//

import Foundation
import SwiftUI

class ThumbnailModelFileManager {
    static let instance = ThumbnailModelFileManager()
    let folderName = "downloaded_thumbnails"
    let thumbExtension = ".png"
    private init() {
        createFolderIfNeeded()
    }
    
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
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    
    private func getImagePath(for key: String) -> URL? {
        guard let folderURL = getFolderPath() else { return nil }
        return folderURL.appendingPathComponent(key + thumbExtension)
    }
    
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
    
    func get(key: String) -> UIImage? {
        guard
            let url = getImagePath(for: key),
            FileManager.default.fileExists(atPath: url.path(percentEncoded: false)) else { return nil }
        return UIImage(contentsOfFile: url.path(percentEncoded: false))
    }
}
