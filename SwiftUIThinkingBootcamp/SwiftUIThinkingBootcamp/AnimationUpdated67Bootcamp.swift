//
//  AnimationUpdated67Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 14/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing AnimationUpdated.
struct AnimationUpdated67Bootcamp: View {
    
    // MARK: PROPERTIES
    @State private var animationActionOne: Bool = false
    @State private var animationActionTwo: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Button("Action one") {
                    animationActionOne.toggle()
                }
                Button("Action two") {
                    animationActionTwo.toggle()
                }
                
               ZStack {
                   Rectangle()
                       .frame(width: 100, height: 100)
                       .frame(maxWidth: .infinity, alignment: animationActionOne ? .leading : .trailing)
                       .background(Color.green)
                       .frame(maxHeight: .infinity, alignment: animationActionTwo ? .top: .bottom)
                       .background(Color.orange)
                }
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .background(Color.red)
            }
        }
        .animation(.spring(), value: animationActionOne)
        .animation(.linear(duration: 2), value: animationActionTwo)
        // Deprecated
//        .animation(.spring())
    }
}


// MARK: PREVIEW
#Preview {
    AnimationUpdated67Bootcamp()
}
