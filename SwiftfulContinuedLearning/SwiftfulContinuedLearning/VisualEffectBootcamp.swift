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
        visualOne
        visualScroll
    }
    
    var visualScroll: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .visualEffect { content, geometry in
                            content.offset(x: geometry.frame(in: .global).minY * 0.5)
                        }
                }
            }
        }
    }
    
    var visualOne: some View {
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
