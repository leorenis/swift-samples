//
//  PaddingAndSpacerBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 27/03/25.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World! This is fun.")
                .background(Color.yellow)
                .padding(.all, 20)
                .padding([.leading, .top], 20)
                .background(Color.blue)
            
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
            
            Text("This is the description of what this view does on this screen. Its a really long description that needs to be wrapped to multiple lines. These lines should be spaced out from each other.")
                .background(Color.blue)
                .padding()
                .background(Color.yellow)
                .padding(.horizontal, 20)
                .background(Color.green)
            
            
            VStack {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)

                Text("This is the description of what this view does on this screen. Its a really long description that needs to be wrapped to multiple lines. These lines should be spaced out from each other.")
                    
            }.padding()
                .padding(.vertical, 30)
                .background(Color.white)
                .cornerRadius(10) // this order is important...
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 10)
            
        }.padding(.horizontal, 10)
    }
}

#Preview {
    PaddingAndSpacerBootcamp()
}
