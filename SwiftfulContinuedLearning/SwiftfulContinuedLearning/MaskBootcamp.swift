//
//  MaskBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 26/05/25.
//

import SwiftUI

/// Mask struct to learning how to mask in SwiftUI.
struct MaskBootcamp: View {
    // MARK: PROPERTIES
    @State private var rating: Int = 3
    
    // MARK: BODY
    var body: some View {
        ZStack {
            starsView
        }
    }
}

// MARK: EXTENSIONS
extension MaskBootcamp {
    /// Gets a view contain a list of starts as a component.
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(rating >= index ? Color.yellow : Color.gray)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    MaskBootcamp()
}
