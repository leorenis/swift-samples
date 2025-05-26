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
    @State private var selectedModel: RandomModel? = nil
    
    // MARK: BODY
    var body: some View {
        // Solution 3
        ScrollView(showsIndicators: false) {
            VStack(spacing: 12) {
                ForEach(0..<20) { index in
                    Button("Sheet \(index)") {
                        selectedModel = RandomModel(title: "Title sheet \(index)")
                    }
                }
            }
            .sheet(item: $selectedModel, content: { model in
                NextScreenSheetView(selectedModel: model)
            })
        }
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

/**
 * We can't use sheet in different hierarchy. So, in solution 2 we comment the code bellow.
 */
