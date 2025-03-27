//
//  ImageBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 26/03/25.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("person.fill.badge.plus")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .frame(width: 300, height: 200)
            .foregroundColor(.green)
            .clipped()
            .cornerRadius(150)
            .clipShape(Circle())
    }
}

#Preview {
    ImageBootcamp()
}
