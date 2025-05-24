//
//  MultipleSheetBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 24/05/25.
//

import SwiftUI
/// Tricks
/// How to: Multiple sheets in a SwiftUI View
struct MultipleSheetBootcamp: View {
    // MARK: PROPERTIES
    @State private var selectedModel: RandomModel = RandomModel(title: "Starting title")
    @State private var showSheet: Bool = false
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 20) {
            Button("Sheet 1") {
                selectedModel = RandomModel(title: "Title sheet One")
                showSheet.toggle()
            }
            
            Button("Sheet 2") {
                selectedModel = RandomModel(title: "Title sheet Two")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            NextScreenSheetView(selectedModel: selectedModel)
        })
    }
}
// MARK: PREVIEW
#Preview {
    MultipleSheetBootcamp()
}


// MARK: MODELS
struct RandomModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
}

// MARK: VIEWS
struct NextScreenSheetView: View {
    // MARK: PROPERTIES
    let selectedModel: RandomModel
    var body: some View {
        ZStack {
            Text("\(selectedModel.title)")
                .font(.title)
                .foregroundStyle(.secondary)
        }
    }
}
