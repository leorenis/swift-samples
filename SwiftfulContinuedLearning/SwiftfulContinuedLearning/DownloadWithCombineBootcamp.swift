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
import Combine

// MARK: CLASSES
@Observable class DownloadWithCombineViewModel {
    fileprivate var posts: [PostModel] = []
    fileprivate var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    /// Get posts using combine framework.
    ///
    /// Core Concepts about publishers/subcribers Analogy: Subscribing a magazine.
    ///
    ///  1. Sign up for monthly subscription for package to be delivery;
    ///  2. The company would make the package behind the scene;
    ///  3. Receive the package at yout front door;
    ///  4. Make sure the box isn't demaged;
    ///  5. Open and make sure the item is correct;
    ///  6. Use the item;
    ///  7. Cancelable at any time!!
    ///
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        /**
         * Steps to implement the combine flow (combine discussion):
         *
         * 1. Create a publisher
         * 2. Subscribe the publisher on background thread
         * 3. Receive on main thread
         * 4. tryMap (check that the data is good)
         * 5. Decode data into [PostModel]
         * 6. Sink (put the item into our app)
         * 7. store (cancel subscription if needed)
         */
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { completion in
                print("Completion: \(completion)")
            } receiveValue: { [weak self] returnedPosts in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)
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
