//
//  BackgroundThreadBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 12/06/25.
//

import SwiftUI
// MARK: VIEWMODEL
class BackgroundThreadViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global().async {
            // the self is required! Because it's create a strong referente to the class ViewModel
            self.dataArray = self.downloadData()
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
            VStack(spacing: 8) {
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
