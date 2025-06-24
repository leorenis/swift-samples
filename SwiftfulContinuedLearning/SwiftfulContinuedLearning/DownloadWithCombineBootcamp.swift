//
//  DownloadWithCombineBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 24/06/25.
//
//  Links:
//  JSON Placeholder: https://jsonplaceholder.typicode.com
//  QuickType: https://app.quicktype.io/
//  Combine: https://developer.apple.com/documentation/combine
//

import SwiftUI

// MARK: CLASSES
@Observable class DownloadWithCombineViewModel {
    fileprivate var posts: [PostModel] = []
    
    init() {
        
    }
    
    /// Get posts using combine framework
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        // 1. Sign up for monthly subscription for package to be delivery;
        // 2. The company would make the package behind the scene;
        // 3. Receive the package at yout front door;
        // 4. Make sure the box isn't demaged;
        // 5. Open and make sure the item is correct;
        // 6. Use the item;
        // 7. Cancelable at any time!!
        
        //
    }
}

// MARK: STRUCTS
/// Struct to learn about download data with combine
struct DownloadWithCombineBootcamp: View {
    // MARK: PROPERTIES
    @State private var vm = DownloadWithCombineViewModel()
    
    // MARK: BODY
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                Group {
                    Text(post.title)
                        .foregroundStyle(.primary)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.secondary)
                }
                
            }
        }
    }
}

// MARK: MODELS
fileprivate struct PostModel: Identifiable, Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// MARK: PREVIEW
#Preview {
    DownloadWithCombineBootcamp()
}
