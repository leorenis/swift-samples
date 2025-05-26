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
    @State private var rating: Int = 4
    
    // MARK: BODY
    var body: some View {
        ZStack {
            starsView
                .overlay( overlayView)
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
                    .foregroundStyle(Color(.systemGray))
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
    
    /// Gets a view Overlay view with geometry reader to provide a Rectangle using in a mask effect.
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(Color(.systemYellow))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    MaskBootcamp()
}
