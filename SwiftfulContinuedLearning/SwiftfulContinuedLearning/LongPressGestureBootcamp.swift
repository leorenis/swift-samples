//
//  LongPressGestureBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 19/05/25.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    // MARK: PROPERTIES
    @State private var isCompleted = false
    
    // MARK: BODY
    var body: some View {
        // simpleLongPressGestureView
        realExempleLongPressGestureView
    }
}

// MARK: EXTENSIONS
extension LongPressGestureBootcamp {
    /// A tiny simple exemple to long pressed gesture using minimumDuration, maximumDistance.
    private var simpleLongPressGestureView: some View {
        Text(isCompleted ? "Completed!" :"Not completed!")
            .padding()
            .padding(.horizontal, 12)
            .background(isCompleted ? Color.green : Color.gray)
            .clipShape(Capsule())
//            .onTapGesture {
//                isCompleted.toggle()
//            }
            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                isCompleted.toggle()
            }
    }
    
    /// A real exemple to long pressed gesture using...
    private var realExempleLongPressGestureView: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(maxWidth: 10)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("click me!")
                    .colorInvert()
                    .padding()
                    .background(Color(.systemCyan))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text("Reset")
                    .colorInvert()
                    .padding()
                    .background(Color(.systemPink))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
                
        }
    }
}

// MARK: PREVIEW
#Preview {
    LongPressGestureBootcamp()
}
