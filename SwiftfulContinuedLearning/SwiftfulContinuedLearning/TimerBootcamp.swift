//
//  TimerBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 25/06/25.
//

import SwiftUI

/// Struct to training publisher subscriber using onreceive.
struct TimerBootcamp: View {
    // MARK: BODY
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))],
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            Text("Hi")
                .font(.system(size: 100, weight: .semibold, design: .rounded))
        }
        
        
        
    }
}

// MARK: PREVIEW
#Preview {
    TimerBootcamp()
}
