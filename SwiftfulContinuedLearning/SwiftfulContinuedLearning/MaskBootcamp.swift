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
    @State private var rating: Int = 0
    
    // MARK: BODY
    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView))
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
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
    
    /// Gets a view Overlay view with geometry reader to provide a Rectangle using in a mask effect.
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    //.foregroundStyle(Color(.systemYellow))
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(.systemYellow), Color(.systemOrange)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false) // Disable click. Only starsView must receive tap
    }
}

// MARK: PREVIEW
#Preview {
    MaskBootcamp()
}
