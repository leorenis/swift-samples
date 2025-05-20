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
        realWorldView
        
    }
}

// MARK: EXTENSIONS
extension MagnificationGestureBootcamp {
    /// Real world exemple using MagnificationGesture
    private var realWorldView: some View {
        VStack(spacing: 12) {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("Swiftful Thinking")
                Spacer()
                Image(systemName: "ellipsis")
                
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            
            Text("This is the caption from my photo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
    
    /// A tiny simple exemple to gesture Magnification.
    private var simpleView: some View {
        VStack {
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
            
            // Group text info.
            Group {
                Text("Current amount: \(currentAmount)")
                Text("Last amount: \(lastAmount)")
            }
            .font(.headline)
        }
    }
}

// MARK: PREVIEW
#Preview {
    MagnificationGestureBootcamp()
}
