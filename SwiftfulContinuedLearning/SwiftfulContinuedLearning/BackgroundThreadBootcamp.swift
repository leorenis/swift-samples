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
