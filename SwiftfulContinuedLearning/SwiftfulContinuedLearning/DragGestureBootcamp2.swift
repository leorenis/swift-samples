//
//  DragGestureBootcamp2.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 22/05/25.
//

import SwiftUI
/// Drag Gesture training
struct DragGestureBootcamp2: View {
    // MARK: PROPERTIES
    @State private var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.83
    @State private var currentDragOffsetY: CGFloat = 0
    @State private var endingOffsetY: CGFloat = 0
    let LIMIT_DRAG_UP: CGFloat = -150
    let LIMIT_DRAG_DOWN: CGFloat = -150
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            DragSignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < LIMIT_DRAG_UP {
                                    endingOffsetY = -startingOffsetY
                                    currentDragOffsetY = 0
                                }
                                else {
                                    currentDragOffsetY = 0
                                }
                            }
                        }
                )
            Text("\(currentDragOffsetY)")
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

// MARK: PREVIEW
#Preview {
    DragGestureBootcamp2()
}

// MARK: SUBVIEWS
struct DragSignUpView: View {
    // MARK: PROPERTIES
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description of the sign up button in the app icon view controller of the Sign Up app template. This is my favorite course in the app.")
                .multilineTextAlignment(.center)
            
            Button {
                
            } label: {
                Text("CREATE AN ACCOUNT")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
