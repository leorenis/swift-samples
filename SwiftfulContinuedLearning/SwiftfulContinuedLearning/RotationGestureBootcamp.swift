//
//  RotationGestureBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 20/05/25.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    var body: some View {
        Text("Rotate me!")
            .colorInvert()
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(50)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    RotationGestureBootcamp()
}
