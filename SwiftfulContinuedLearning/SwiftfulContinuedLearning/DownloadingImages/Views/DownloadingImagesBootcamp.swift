//
//  DownloadingImagesBootcamp.swift
//  SwiftfulContinuedLearning
//  Created by Leo on 03/07/25.
//
//  Links:
//  JSON Placeholder: https://jsonplaceholder.typicode.com
//  QuickType: https://app.quicktype.io/
//

import SwiftUI

/**
 *  We will cover:
 *  - Background threads
 *  - Weak Self
 *  - Combine Framework
 *  - Publishers and Subscribers
 *  - FileManager
 *  - NSCache
 */

/// Downloading images view
struct DownloadingImagesBootcamp: View {
    // MARK: BODY
    var body: some View {
        NavigationStack {
            List {
                Text("Downloading Images Bootcamp")
            }
            .navigationTitle("Downloading images")
        }
    }
}

// MARK: PREVIEW
#Preview {
    DownloadingImagesBootcamp()
}
