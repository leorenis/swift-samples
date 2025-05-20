//
//  LongPressGestureBootcamp.swift
//  SwiftfulContinuedLearning
//  Episode: https://youtu.be/Ioux-yqewNs?si=JSPx6lgom8k0Kta-
//  Created by Leo on 19/05/25.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    // MARK: PROPERTIES
    @State private var isCompleted = false
    @State private var isSuccess = false
    
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
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("click me!")
                    .colorInvert()
                    .padding()
                    .background(Color(.systemCyan))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50, perform: {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }, onPressingChanged: { isPressing in
                        // Start of press -> min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isCompleted = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if (!isSuccess) {
                                    withAnimation(.easeInOut) {
                                        isCompleted = false
                                    }
                                }
                            }
                        }
                    })
                
                
                Text("Reset")
                    .colorInvert()
                    .padding()
                    .background(Color(.systemPink))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isCompleted = false
                            isSuccess = false
                        }
                    }
            }
                
        }
    }
}

// MARK: PREVIEW
#Preview {
    LongPressGestureBootcamp()
}
