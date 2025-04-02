//
//  ToggleBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 01/04/25.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status: ")
                Text(toggleIsOn ? "On 🍻" : "Off 👀")
            }
            .font(.headline)
            
            Toggle(isOn: $toggleIsOn, label: {
                Text("Change status")
            })
            .toggleStyle(
                SwitchToggleStyle(
                    tint: Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1))
                )
            )
            
            Spacer()
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    ToggleBootcamp()
}
