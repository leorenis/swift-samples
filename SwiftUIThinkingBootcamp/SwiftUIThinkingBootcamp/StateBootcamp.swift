//
//  StateBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 28/03/25.
//

import SwiftUI

struct StateBootcamp: View {
    
    @State var backgroundColor: Color = .green
    @State var title: String = "No button pressed yet"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            // Background
            backgroundColor
                .ignoresSafeArea(edges: .all)
            
            
            // Content
            VStack (spacing: 20) {
                Text(title)
                    .font(.title)
                
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack (spacing: 20) {
                    Button("Button 1".uppercased()) {
                        // using self
                        self.backgroundColor = .red
                        self.title = "Button #1 pressed"
                        self.count += 1
                    }
                    
                    Button("Button 1".uppercased()) {
                        backgroundColor = .purple
                        title = "Button #2 pressed"
                        self.count -= 1
                        
                    }
                }
            }
            .foregroundColor(.white)
            
        }
    }
}

#Preview {
    StateBootcamp()
}
