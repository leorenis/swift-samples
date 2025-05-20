//
//  RotationGestureBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 20/05/25.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    // MARK: PROPERTIES
    @State private var angle: Angle = Angle(degrees: 0)
    
    // MARK: BODY
    var body: some View {
        Text("Rotate me!")
            .colorInvert()
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(50)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = .zero
                        }
                    }
            )
    }
}

// MARK: PREVIEW
#Preview {
    RotationGestureBootcamp()
}
