//
//  SpacerBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 27/03/25.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
        /*
        let min: CGFloat = 50
        HStack (spacing: nil) {
            Spacer(minLength: nil)
                .frame(height: 10)
                .background(Color.green)
            
            Rectangle()
                .fill(Color.red)
                .frame(width: min, height: min)
            
            Spacer()
                .frame(height: 10)
                .background(Color.green)
            
            Rectangle()
                .fill(Color.blue)
                .frame(width: min, height: min)
            
            Spacer()
                .frame(height: 10)
                .background(Color.green)
            
            Rectangle()
                .fill(Color.purple)
                .frame(width: min, height: min)
            
            Spacer()
                .frame(height: 10)
                .background(Color.green)
            
        }
        // .background(Color.yellow)
        */
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "xmark")
                Spacer()
                    .frame(height: 10)
                    .background(Color.orange)
                Image(systemName: "gear")
            }
            .font(.title)
            .padding(.horizontal)
            .background(Color.yellow)
            
            Spacer()
                .frame(width: 10)
                .background(Color.orange)
            
            HStack(spacing: 0) {
                Text("Possible Navbar")
            }
        }.background(Color.yellow)
        
    }
}

#Preview {
    SpacerBootcamp()
}
