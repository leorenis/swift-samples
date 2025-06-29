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
    private init() {} // As a singleton, its must not be initialized out of this class.
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.jpegData(compressionQuality: 1.0) else {
            print("Error getting data.")
            return
        }
//        let DocDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
//        let directoryTmp = FileManager.default.temporaryDirectory
//        let path = directory?.appendingPathComponent("\(name).jpg")
        
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent("\(name).jpg") else {
            print("Error getting path")
            return
        }
                
        do {
            try data.write(to: path)
            print("Success saving")
        } catch let error {
            print("Error saving \(error)")
        }
    }
}

// MARK: VIEW MODELS
class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let imageName: String = "dog"
    fileprivate let manager = LocalFileManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func saveImage() {
        guard let image else { return }
        manager.saveImage(image: image, name: imageName)
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
