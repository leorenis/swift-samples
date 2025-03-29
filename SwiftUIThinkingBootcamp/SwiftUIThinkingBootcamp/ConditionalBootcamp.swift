//
//  ConditionalBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 29/03/25.
//

import SwiftUI

struct ConditionalBootcamp: View {
    
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Circle button: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Rectangle button: \(showRectangle.description)") {
                showRectangle.toggle()
            }
            
            if showCircle {
                Circle()
                    .frame(width: 100, height: 100)
            }
            if showRectangle {
                Rectangle()
                    .frame(width: 100, height: 100)
            }
            if showCircle && showRectangle {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
            }
            
            // Loading
            Button("Is loading: \(isLoading.description)") {
                isLoading.toggle()
            }
            if isLoading {
                ProgressView()
            }
            
            Spacer()
        }
    }
}

#Preview {
    ConditionalBootcamp()
}
