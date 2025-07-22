//
//  VisualEffectBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 21/07/25.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    @State private var showSpacer: Bool = false
    var body: some View {
        VStack {
            Text("Learning Visual Effect!")
                .padding()
                .background(.red)
                .visualEffect { content, geometry in
                    content
                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
//                    content.grayscale(geometry.size.width >= 200 ? 1 : 0)
                }
            
            if showSpacer {
                Spacer()
            }
        }
        .animation(.easeIn, value: showSpacer)
        .onTapGesture {
            showSpacer.toggle()
        }
    }
}

#Preview {
    VisualEffectBootcamp()
}
