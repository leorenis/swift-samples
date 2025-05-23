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
    // MARK: BODY
    var body: some View {
       ScrollView {
           ForEach(0..<50) { index in
               Text("This is de item number \(index)")
                   .font(.headline)
                   .frame(height: 200)
                   .frame(maxWidth: .infinity)
                   .background(.white)
                   .clipShape(RoundedRectangle(cornerRadius: 24))
                   .shadow(radius: 8)
                   .padding()
           }
        }
    }
}

// MARK: PREVIEW
#Preview {
    ScrollViewReaderBootcamp()
}
