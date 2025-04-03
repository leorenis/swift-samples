//
//  StepperBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 02/04/25.
//

import SwiftUI

struct StepperBootcamp: View {
    @State var stepperValue: Int = 10
    @State var withSize: CGFloat = 10
    
    var body: some View {
        VStack (spacing: 10) {
            Stepper("Stepper e.g. \(stepperValue)", value: $stepperValue)
            
            Stepper("Stepper Rectangle") {
                incrementWith()
            } onDecrement: {
                decrementWith()
            }
            
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)))
                .frame(
                    width: 100 + withSize,
                    height: 100 // + withSize
                )
                .cornerRadius(15)
            
        }.padding(.horizontal, 20)
    }
    
    fileprivate func incrementWith(amount: CGFloat = 10) {
        withAnimation(.easeInOut) {
            withSize += amount
        }
    }
    
    fileprivate func decrementWith(amount: CGFloat = 10) {
        withAnimation(.easeInOut) {
            withSize -= amount
        }
    }
}

#Preview {
    StepperBootcamp()
}
