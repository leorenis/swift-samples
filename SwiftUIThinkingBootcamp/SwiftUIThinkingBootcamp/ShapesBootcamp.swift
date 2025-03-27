//
//  ShapesBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo Renis Santos on 26/03/25.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        // Circle()
        // Ellipse()
        // Capsule(style: .circular)
        // Rectangle()
        RoundedRectangle(cornerRadius: 10)
            // .fill(Color.gray)
            // .foregroundColor(.pink)
            // .stroke()
            // .stroke(Color.red, style: StrokeStyle())
            // .stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [30]))
            // .trim(from: 0.2, to: 1.0)
            // .stroke(Color.purple, lineWidth: 50)
            // .trim(from: 0.2, to: 1.0)
            // .stroke(Color.purple, lineWidth: 50)
            .frame(width: 300, height: 200)
            
           
    }
}

#Preview {
    ShapesBootcamp()
}
