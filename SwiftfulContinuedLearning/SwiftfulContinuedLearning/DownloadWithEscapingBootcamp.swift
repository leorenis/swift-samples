//
//  DownloadWithEscapingBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 19/06/25.
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
