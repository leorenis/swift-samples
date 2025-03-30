//
//  TernaryBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 30/03/25.
//

import SwiftUI

struct TernaryBootcamp: View {
    
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack (spacing: 12) {
            Button("Button: \(isStartingState.description)") {
                isStartingState.toggle()
            }
            
            Text(isStartingState ? "Ending state" : "Starting..." )
            
            RoundedRectangle(cornerRadius: isStartingState ? 20 : 0)
                .fill(isStartingState ? Color.red : Color.yellow)
                .frame(
                    width: isStartingState ? 200 : 250,
                    height: isStartingState ? 100 : 150
                )
            
            Spacer()
        }
    }
}

#Preview {
    TernaryBootcamp()
}
