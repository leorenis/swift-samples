//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 23/05/25.
//

import SwiftUI
/// Struct to training Scroll View Reader
struct ScrollViewReaderBootcamp: View {
    // MARK: PROPERTIES
    @State private var scrollContent: String = ""
    @State private var scrollToIndex: Int = 0
    
    // MARK: BODY
    var body: some View {
        VStack {
            TextField("Enter a number to scroll to", text: $scrollContent)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Click to scroll") {
                if let index = Int(scrollContent) {
                    scrollToIndex = index
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is de item number #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .shadow(radius: 8)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) {
                        withAnimation (.spring()) {
                            proxy.scrollTo(scrollToIndex, anchor: .bottom)
                        }
                    }
                }
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    ScrollViewReaderBootcamp()
}
