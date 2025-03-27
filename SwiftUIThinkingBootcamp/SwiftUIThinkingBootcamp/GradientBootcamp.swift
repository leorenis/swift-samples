//
//  GradientBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 26/03/25.
//

import SwiftUI

struct GradientBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                // Color.red
                // LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                // RadialGradient(gradient: Gradient(colors: [.red, .blue]), center: .topLeading, startRadius: 5, endRadius: 400)
                AngularGradient(gradient: Gradient(colors: [.red, .blue]), center: .topLeading, angle: .degrees(180 + 45))
            )
            .frame(width: 300, height: 200)
            
    }
}

#Preview {
    GradientBootcamp()
}
