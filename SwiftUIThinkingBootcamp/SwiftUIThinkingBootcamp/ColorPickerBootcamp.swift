//
//  ColorPickerBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 02/04/25.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    
    @State var backgroundColor: Color = .red
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(edges: .all)
            
            ColorPicker("Select a color", selection: $backgroundColor, supportsOpacity: true)
                .padding(20)
                .background(Color.black)
                .cornerRadius(10)
                .font(.headline)
                .padding(.horizontal, 50)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ColorPickerBootcamp()
}
