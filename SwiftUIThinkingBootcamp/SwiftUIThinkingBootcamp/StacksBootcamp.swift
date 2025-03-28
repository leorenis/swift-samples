//
//  StacksBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 27/03/25.
//

import SwiftUI

struct StacksBootcamp: View {
    // VStack -> Vertical
    // HStack -> Horizontal
    // ZStacks -> zIndex (back to front)
    var body: some View {
        /*
        let max: CGFloat = 100
        let medium: CGFloat = 75
        let min: CGFloat = 50
        
        // VStack
        VStack(alignment: .center, spacing: 0, content: {
            Rectangle()
                .fill(Color.red)
                .frame(width: max, height: max)
            
            Rectangle()
                .fill(Color.green)
                .frame(width: medium, height: medium)
            
            Rectangle()
                .fill(Color.blue)
                .frame(width: min, height: min)
        })
        
        // HStack
        HStack(alignment: .center, spacing: 0, content: {
            Rectangle()
                .fill(Color.red)
                .frame(width: max, height: max)
            
            Rectangle()
                .fill(Color.green)
                .frame(width: medium, height: medium)
            
            Rectangle()
                .fill(Color.blue)
                .frame(width: min, height: min)
        })
        
        // ZStack
        ZStack(alignment: .center, content: {
            Rectangle()
                .fill(Color.red)
                .frame(width: max, height: max)
            
            Rectangle()
                .fill(Color.green)
                .frame(width: medium, height: medium)
            
            Rectangle()
                .fill(Color.blue)
                .frame(width: min, height: min)
        })
        */
        
        
        /*
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 350, height: 500)
            VStack(alignment: .leading, spacing: 15) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: max, height: max)
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: medium, height: medium)
                
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: min, height: min)
                
                HStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 35, height: 35)
                    
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 45, height: 45)
                    Rectangle()
                        .fill(Color.brown)
                        .frame(width: 50, height: 50)
                }.background(Color.white)
            }.background(Color.cyan)
        }
        */
        
        VStack(alignment: .center, spacing: 15) {
            Text("5")
                .font(.largeTitle)
                .underline()
            Text("Items in yout cart")
                .font(.caption)
                .foregroundColor(.gray)
        }
        
        VStack(spacing: 50) {
            // If super complex UI, choose this.
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            
            // You should choose background always as possible
            Text("1")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
        }
    }
}

#Preview {
    StacksBootcamp()
}
