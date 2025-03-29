//
//  ExtratedFunctionsBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 28/03/25.
//

import SwiftUI

struct ExtratedFunctionsBootcamp: View {
    
    @State var bakcgroundColor: Color = .pink
    @State var toggle: Bool = false
    
    var body: some View {
        ZStack {
            
            // Background
            bakcgroundColor
                .ignoresSafeArea(.all)
            
            // content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        // Content
        VStack {
            Text("What's gonna happen?")
                .font(.title)
            
            Button(action: {
                buttonPressed()
            }, label: {
                Text("Press me".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            })
        }
    }
    
    func toggleColor() {
        toggle = !toggle
    }
    
    func buttonPressed() {
        bakcgroundColor = toggle ? .pink : .yellow
        toggleColor()
    }
}

#Preview {
    ExtratedFunctionsBootcamp()
}
