//
//  MultipleSheetBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 24/05/25.
//

/**
 * Problem: When content: closure is created, @State selectedModel still starting title.
 * The content is created, before selectedModel receive the current value, in this case a new RandomModel(...)
 *
 *  Solution:
 *  1. use a binding;
 *  2. use multiple .sheets;
 *  3. use $item approach.
 */

import SwiftUI
/// Tricks
/// How to: Multiple sheets in a SwiftUI View
struct MultipleSheetBootcamp: View {
    // MARK: PROPERTIES
    @State private var selectedModel: RandomModel = RandomModel(title: "Starting title")
    @State private var showSheet: Bool = false
    @State private var showSheet2: Bool = false
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 20) {
            Button("Sheet 1") {
                selectedModel = RandomModel(title: "Title sheet One")
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet) {
                NextScreenSheetView(selectedModel: RandomModel(title: "Sheet one"))
            }
            
            Button("Sheet 2") {
                selectedModel = RandomModel(title: "Title sheet Two")
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2, content: {
                NextScreenSheetView(selectedModel: RandomModel(title: "Sheet two"))
            })
        }
//  We can't use sheet in different hierarchy. So, in solution 2 we comment the code bellow.
//        .sheet(isPresented: $showSheet, content: {
//            NextScreenSheetView(selectedModel: $selectedModel)
//        })
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
    // @Binding var selectedModel: RandomModel // solution 1
    let selectedModel: RandomModel
    var body: some View {
        ZStack {
            Text("\(selectedModel.title)")
                .font(.title)
                .foregroundStyle(.secondary)
        }
    }
}
