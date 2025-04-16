//
//  ViewThatFits71Bootcamp.swift
//  SwiftUIThinkingBootcamp
// Episode: https://youtu.be/oN3Rqo6V6Uc?si=I-pOA4u3l1uz8CvI
//
//  Created by Leo on 16/04/25.
//

import SwiftUI
/// A data struct to provide struct to practicing ViewFits.
struct ViewThatFits71Bootcamp: View {
    var body: some View {
        ZStack {
            // Background
            Color.teal
                .edgesIgnoringSafeArea(.all)
            
            // Foreground
            
            /**
             *  ViewThatFits selects the first child whose ideal size on the constrained axes fits within the proposed size. This means that you provide views in order of preference. Usually this order is largest to smallest
             */
            ViewThatFits (in: .horizontal) {
                Text("This is some text that will overflow, I hope you see it in action here!")
                Text("This is some text that will overflow, I hope you see it!")
                Text("This is some text that will overflow!")
            }
//            .lineLimit(1)
//            .minimumScaleFactor(0.3)
                
        }
        .frame(height: 300)
        .padding(16)
        .font(.headline)
        
    }
}

// MARK: PREVIEW
#Preview {
    ViewThatFits71Bootcamp()
}
