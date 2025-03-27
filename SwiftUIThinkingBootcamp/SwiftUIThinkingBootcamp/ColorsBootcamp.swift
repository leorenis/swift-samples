//
//  ColorsBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 26/03/25.
//

import SwiftUI

struct ColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                // Color.purple
                // Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
                // Color(UIColor.secondarySystemBackground)
                Color("CustomColor")
            )
            .frame(width: 300, height: 200)
            // .shadow(radius: 10)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -2, y: -20)
            
    }
}

#Preview {
    ColorsBootcamp()
}
