//
//  ControlGroupMenu75Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 20/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing ControlGroupMenu.
struct ControlGroupMenu75Bootcamp: View {
    var body: some View {
        Menu ("Control Group Menu") {
            ControlGroup {
                Button("One") {}
                Button("Two") {}
                Button("Tree") {}
                
                Menu("How are you?") { // MUST have a label
                    Button("Good") {}
                    Button("Bad") {}
                }
            }
            
            Button("Button menu") {}
            
            Menu ("Root level menu") { // MUST have a label
                Button("Four") {}
                Button("Five") {}
                
            }
            
        }
    }
}


// MARK: PREVIEW
#Preview {
    ControlGroupMenu75Bootcamp()
}
