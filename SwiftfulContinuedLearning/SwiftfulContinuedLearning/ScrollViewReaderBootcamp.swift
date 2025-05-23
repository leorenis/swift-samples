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
    @State private var scrollText: String = ""
    // MARK: BODY
    var body: some View {
        VStack {
            TextField("Enter a number to scroll to", text: $scrollText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            
            ScrollView {
                ScrollViewReader { proxy in
                    Button("Click to #30") {
                        withAnimation (.spring()) {
                            proxy.scrollTo(30, anchor: .bottom)
                        }
                    }
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
                }
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    ScrollViewReaderBootcamp()
}
