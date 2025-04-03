//
//  SliderBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 02/04/25.
//

import SwiftUI

struct SliderBootcamp: View {
    @State var sliderValue: CGFloat = 10.0
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            Text("Slider Value:")
            Text(
                String(format: "%.1f", sliderValue)
                //"\(sliderValue)"
            )
            .foregroundColor(color)
            
            //Slider(value: $sliderValue)
            //Slider(value: $sliderValue, in: 0...100)
            //Slider(value: $sliderValue, in: 0...100, step: 4.0)
            Slider(
                value: $sliderValue,
                in: 0...50,
                step: 1.0,
                label: {
                    Text("Title here")
                },
                minimumValueLabel: {
                    Text("Min")
                        .font(.caption)
                },
                maximumValueLabel: {
                    Text("Max")
                        .font(.caption)
                },
                onEditingChanged: { (_) in
                    color = .blue
                }
            )
            .accentColor(color)
        }.padding(.horizontal, 20)
        
    }
}

#Preview {
    SliderBootcamp()
}
