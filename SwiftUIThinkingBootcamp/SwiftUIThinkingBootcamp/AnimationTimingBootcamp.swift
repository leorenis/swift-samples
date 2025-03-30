//
//  AnimationTimingBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 30/03/25.
//

import SwiftUI

struct AnimationTimingBootcamp: View {
    
    @State var isAnimating: Bool = false
        
    var body: some View {
        ActionButtonView(isAnimating: $isAnimating)
        
        CurvesAnimationView(isAnimating: isAnimating)
        SpringAnimationView(isAnimating: isAnimating)
        
    }
}

struct ActionButtonView: View {

    @Binding var isAnimating: Bool
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
            }
        }
    }
}

struct SpringAnimationView: View {
    
    let isAnimating: Bool
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(
                    Animation
                        .spring(
                            response: 0.5,
                            dampingFraction: 0.7,
                            blendDuration: 1.0
                        ),
                    value: isAnimating)
        }
    }
}

struct CurvesAnimationView: View {
    let isAnimating: Bool
    let timing: Double = 5.0
    
    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.linear(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeIn(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeInOut(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeOut(duration: timing), value: isAnimating)
        }
    }
}

#Preview {
    AnimationTimingBootcamp()
}
