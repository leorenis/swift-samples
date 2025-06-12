//
//  BackgroundThreadBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 12/06/25.
//
// This approach is super important when downloading data, streaming videos, images from the internet or any heavy process in our app.

import SwiftUI
// MARK: VIEWMODEL
class BackgroundThreadViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        /// qos means: quality-of-service Class. Read more on documentation.
        DispatchQueue.global(qos: .background).async {
            // the self is required! Because it's create a strong referente to the class ViewModel
            let newData = self.downloadData()
            /**
             * The code has a problem:
             * ```
             *  self.dataArray = self.downloadData()
             * ```
             * Problem: Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates. In other words, we're not allowed to change dataArray in background thread, because this attribute changes the UI that's use the main thread.
             *
             * Solution: Use DispatchQueue.main.async to changes dataArray.
             */
            DispatchQueue.main.async {
                self.dataArray = newData
            }
        }
    }
    
    /// Simulates download data.
    private func downloadData() -> [String] {
        var data: [String] = []
        for x in 0..<100 {
            data.append("item: \(x)")
        }
        return data
    }
}

// MARK: STRUCTS
struct BackgroundThreadBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = BackgroundThreadViewModel()
    
    // MARK: BODY
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    BackgroundThreadBootcamp()
}
