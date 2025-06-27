//
//  FileManagerBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 27/06/25.
//

import SwiftUI

// MARK: VIEW MODELS
class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
}

/// Struct to learning about FileManager
struct FileManagerBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = FileManagerViewModel()
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            VStack {
               Image("dog")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 288, height: 330)
                   .clipped()
                   .clipShape(RoundedRectangle(cornerRadius: 12))
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
