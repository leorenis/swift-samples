//
//  DownloadingImagesBootcamp.swift
//  SwiftfulContinuedLearning
//  Created by Leo on 03/07/25.
//
//  Links:
//  Dummy JSON: https://dummyjson.com/products?limit=10&skip=10&select=title,price,thumbnail
//  QuickType: https://app.quicktype.io/
//

import SwiftUI

/**
 *  We will cover:
 *  - Codable
 *  - Background threads
 *  - Weak Self
 *  - Combine Framework
 *  - Publishers and Subscribers
 *  - FileManager
 *  - NSCache
 */

/// Downloading images view
struct DownloadingImagesBootcamp: View {
    // MARK: PROPERTIES
    @StateObject var vm = DownloadingImagesViewModel()
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.dataArray) { model in
                    HStack {
                        Circle()
                            .frame(width: 75, height: 75)
                        
                        VStack(alignment: .leading) {
                            Text(model.title)
                                .font(.headline)
                            Text(model.thumbnail)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .italic(true)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .navigationTitle("Downloading images")
        }
    }
}

// MARK: PREVIEW
#Preview {
    DownloadingImagesBootcamp()
}
