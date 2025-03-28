//
//  TextBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 26/03/25.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, World! This is the SwiftfulThinking Bootcamp. I am really excited to learn SwiftUI! I am just learn a lot.")
            .font(.body)
            .fontWeight(.semibold)
            .bold()
            .underline()
            .underline(true, color: Color.red)
            .italic()
            .strikethrough()
            .font(.system(size: 24, weight: .semibold, design: .serif))
            .baselineOffset(4)
            .multilineTextAlignment(.leading)
            .foregroundColor(.blue)
            .padding()
            .frame(width: 300, height: 200)
            .minimumScaleFactor(0.1)
    }
}

#Preview {
    TextBootcamp()
}
