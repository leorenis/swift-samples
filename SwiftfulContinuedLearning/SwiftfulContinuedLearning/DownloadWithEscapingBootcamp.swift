//
//  DownloadWithEscapingBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 19/06/25.
//  HTTP Response Status Codes: https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status
//  JSON Placeholder: https://jsonplaceholder.typicode.com
//  QuickType: https://app.quicktype.io/
//
//  Inicial v1: https://tinyurl.com/3d5znvsv
//  Intermediate v2: https://tinyurl.com/5n7wut4r
//  Advanced v3: https://tinyurl.com/ysnk96es
//

import SwiftUI

// MARK: CLASSES
class DownloadWithEscapingViewModel: ObservableObject {
    @Published fileprivate var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    fileprivate func getPosts() {
        let strPostOneURL = "https://jsonplaceholder.typicode.com/posts/1"
        let strPostsURL = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: strPostsURL) else { return }
        
        downloadDataHandler(from: url) { downloadedData in
            if let data = downloadedData {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                /// IMPORTANT TIP: Always we manipulate @Published data or any data to our Views (UI),
                ///  these data must update only from the MAIN Thread, and here we're in a Task in background.
                ///  So, we MUST to do in main thread using DispatchQueue.main.async and [weak self] as bellow.
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("No data returned")
            }
        }
    }
    
    /// The downloadDataHandler method is a function that downloads data from a specified URL.
    /// It utilizes the URLSession class to perform the download and returns the downloaded data through the completionHandler block.
    ///
    /// Important:
    /// - .resume() here is like the start the function or task here... The task do not starts until call resume.
    ///
    /// - Parameters:
    ///   - url: A completion block that is called after the download is complete. It receives the downloaded data (Data) as a parameter
    ///   - completionHandler: The address of the URL from which to download the data.
    ///
    ///   ```swift
    ///     downloadDataHandler(from: url) { (data) in
    ///         if let data = data {
    ///             print("Data downloaded successfully: \(String(data: data, encoding: .utf8)!)")
    ///         } else {
    ///             print("Error downloading data.")
    ///         }
    ///     }
    ///
    ///   ```
    func downloadDataHandler(from url: URL, completionHandler: @escaping DownloadData) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                error == nil,
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                print("Error downloading data.")
                completionHandler(nil) // If fails, completionHandler with nil
                return
            }
            completionHandler(data)
        }.resume()  // Tip: .resume() here is like the start the function or task here... The task do not starts until call resume.
    }
}

// MARK: TYPEALIAS
typealias DownloadData = (_ data: Data? ) -> ()

// MARK: STRUCTS
/// Struct to learning about download data from the internet using escaping.
struct DownloadWithEscapingBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = DownloadWithEscapingViewModel()
    
    // MARK: BODY
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                        .padding(.bottom)
                    
                    Text(post.body)
                        .foregroundStyle(.secondary)
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

// MARK: MODELS
struct PostModel: Identifiable, Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// MARK: PREVIEW
#Preview {
    DownloadWithEscapingBootcamp()
}
