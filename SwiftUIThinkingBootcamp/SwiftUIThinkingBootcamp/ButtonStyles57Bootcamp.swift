//
//  ButtonStyles57Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 08/04/25.
//

import SwiftUI

struct ButtonStyles57Bootcamp: View {
    /// This is the foreground layer that holds a scrollView
    var body: some View {
        VStack (spacing: 20.0) {
            
            // Applying Custom Styles by label
            Button(action: {
                // Action
            }, label: {
                Text("Button title")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            // Border Prominent large
            Button("Border Prominent large"){
                // action
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity) // This .infinity works only on label
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            // Border bordered small
            Button("Button plain large"){
                // action
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            .controlSize(.large)
            
            // Border automatic regular
            Button("Button automatic regular"){
                // action
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .buttonStyle(.automatic)
            .controlSize(.regular)
            
            // Border bordered small
            Button("Button bordered small"){
                // action
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            .controlSize(.small)
            
            // Border bordered small
            Button("Button borderless mini"){
                // action
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
            .controlSize(.mini)
            
        }
        .padding()
    }
}

#Preview {
    ButtonStyles57Bootcamp()
}
