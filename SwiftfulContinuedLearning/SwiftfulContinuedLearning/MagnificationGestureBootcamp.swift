//
//  MagnificationGestureBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 20/05/25.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    // MARK: PROPERTIES
    @State private var currentAmount: CGFloat = 0
    @State private var lastAmount: CGFloat = 0
    
    // MARK: BODY
    var body: some View {
        simpleView
    }
}

extension MagnificationGestureBootcamp {
    private var simpleView: some View {
        Text("Zoom me in!")
            .padding(40)
            .font(.title2)
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .scaleEffect(1 + currentAmount + lastAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
                    .onEnded { value in
                        lastAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

// MARK: PREVIEW
#Preview {
    MagnificationGestureBootcamp()
}
