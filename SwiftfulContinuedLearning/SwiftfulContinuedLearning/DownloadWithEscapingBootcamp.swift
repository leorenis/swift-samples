//
//  DownloadWithEscapingBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 19/06/25.
//  HTTP Response Status Codes: https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status
//  JSON Placeholder: https://jsonplaceholder.typicode.com
//  QuickType: https://app.quicktype.io/
//

import SwiftUI

// MARK: CLASSES
class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published fileprivate var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    fileprivate func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("No data.")
                return
            }
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print( "Invalid HTTPURLResponse.")
                return
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status code should be between 200 and 300, but got status code: \(response.statusCode)")
                return
            }
            
            // print("Successfully downloaded data!")
            // let jsonString = String(data: data, encoding: .utf8)
            // print(jsonString as Any)
            
            do {
                let dataDecoded = try JSONDecoder().decode(PostModel.self, from: data)
                /// IMPORTANT TIP: Always we manipulate @Published data or any data to our Views (UI), these data must update only from the MAIN Thread, and here we're in a Task in background. So, we MUST to do in main thread using DispatchQueue.main.async and [weak self] as bellow.
                DispatchQueue.main.async { [weak self] in
                    self?.posts.append(dataDecoded)
                }
                
            } catch let error {
                print("Error: \(error)")
            }
            
        }.resume() // Tip: .resume() here is like the start the function or task here... The task do not starts until call resume.
    }
}

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
