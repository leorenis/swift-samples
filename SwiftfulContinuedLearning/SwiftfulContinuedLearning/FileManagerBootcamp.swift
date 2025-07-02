//
//  FileManagerBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 27/06/25.
//  Optimizing Your App’s Data for iCloud Backup: https://developer.apple.com/documentation/foundation/optimizing-your-app-s-data-for-icloud-backup
//

import SwiftUI

fileprivate class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    private init() { // As a singleton, its must not be initialized out of this class.
       createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true , attributes: nil)
                print("Success creating directory")
            } catch let error {
                print("Error creating directory: \(error)")
            }
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPath(forImage: name)
        else {
            return "Error getting data."
        }
//        let DocDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
//        let directoryTmp = FileManager.default.temporaryDirectory
//        let path = directory?.appendingPathComponent("\(name).jpg")
          
        do {
            try data.write(to: path)
            print(path)
            return "Success saving"
        } catch let error {
            return "Error saving \(error)"
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPath(forImage: name)?.path(percentEncoded: false),
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPath(forImage: name)?.path(percentEncoded: false),
            FileManager.default.fileExists(atPath: path) else {
            return "Error getting path"
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted."
        } catch let error {
            return "Error deleting image \(error)"
        }
    }
    
    func getPath(forImage name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpg") else {
            print("Error getting path")
            return nil
        }
        return path
    }
}

// MARK: VIEW MODELS
class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var infoMessage: String = ""
    let imageName: String = "dog"
    fileprivate let manager = LocalFileManager.instance
    
    init() {
        //getImageFromAssetsFolder()
        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
    }
    
    func saveImage() {
        guard let image else { return }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
}

/// Struct to learning about FileManager
struct FileManagerBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = FileManagerViewModel()
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 288, height: 330)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    HStack {
                        Button {
                            vm.saveImage()
                        } label: {
                            Text("Save to FM")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(height: 55)
                                .padding(.horizontal, 60)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        
                        Button {
                            vm.deleteImage()
                        } label: {
                            Text("Delete from FM")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(height: 55)
                                .padding(.horizontal, 60)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                    
                    Text(vm.infoMessage)
                        .font(.headline)
                        .foregroundStyle(.purple)
                }
                Spacer()
           }
            .navigationTitle("File manager")
        }
    }
}

// MARK: PREVIEW
#Preview {
    FileManagerBootcamp()
}
