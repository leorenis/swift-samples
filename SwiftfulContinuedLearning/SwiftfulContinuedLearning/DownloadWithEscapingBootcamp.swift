//
//  DownloadWithEscapingBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 19/06/25.
//  HTTP Response Status Codes: https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status
//

import SwiftUI

// MARK: CLASSES
class DownloadWithEscapingViewModel: ObservableObject {
    init() {
        getPosts()
    }
    
    fileprivate func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
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
            
            print("Successfully downloaded data!")
            print(data)
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString as Any)
            
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
        Text("Hello, DownloadWithEscaping!")
    }
}

// MARK: PREVIEW
#Preview {
    DownloadWithEscapingBootcamp()
}
