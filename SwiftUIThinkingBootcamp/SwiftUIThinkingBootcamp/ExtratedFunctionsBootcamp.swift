//
//  ExtratedFunctionsBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo Renis Santos on 28/03/25.
//

import SwiftUI

struct ExtratedFunctionsBootcamp: View {
    
    @State var bakcgroundColor: Color = .pink
    
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
            Text("Title")
                .font(.largeTitle)
            
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
    
    func buttonPressed() {
        bakcgroundColor = .yellow
    }
}

#Preview {
    ExtratedFunctionsBootcamp()
}
