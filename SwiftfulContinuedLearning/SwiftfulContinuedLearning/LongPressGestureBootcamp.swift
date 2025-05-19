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
}

// MARK: PREVIEW
#Preview {
    LongPressGestureBootcamp()
}
