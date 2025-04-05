//
//  TapGestureBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 04/04/25.
//

import SwiftUI

struct TapGestureBootcamp: View {
    
    // MARK: PROPERTIES
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack (spacing: 40) {
            RoundedRectangle(cornerRadius: 25)
                .fill(isSelected ? Color.green : Color.blue)
                .frame(height: 200)
            
            Button(action: {
                isSelected.toggle()
            }, label: {
                
                // Button Shows a Higlightted state when click is pressed!
                Text("Tap Button")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.cornerRadius(25))
            })
            
            Text("TAP Gesture")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue.cornerRadius(15))
                /*.onTapGesture {
                    isSelected.toggle()
                }*/
                .onTapGesture(count: 2) { // Will perform when gesture is Double TAP
                    isSelected.toggle()
                }
            
            Spacer()

        }
        .padding()
    }
}

// MARK: PREVIEW
#Preview {
    TapGestureBootcamp()
}
