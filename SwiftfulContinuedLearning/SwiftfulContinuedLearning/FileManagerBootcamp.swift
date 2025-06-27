//
//  FileManagerBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 27/06/25.
//

import SwiftUI

/// Struct to learning about FileManager
struct FileManagerBootcamp: View {
    // MARK: PROPERTIES
    
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
           }
        }
    }
}

// MARK: PREVIEW
#Preview {
    FileManagerBootcamp()
}
