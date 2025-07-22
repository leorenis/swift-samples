//
//  VisualEffectBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 21/07/25.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    var body: some View {
        Text("Hello, Visual Effect!")
            .padding()
            .frame(width: 100)
            .background(.red)
            .grayscale(0)
    }
}

#Preview {
    VisualEffectBootcamp()
}
