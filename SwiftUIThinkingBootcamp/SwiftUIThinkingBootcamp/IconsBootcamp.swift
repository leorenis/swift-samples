//
//  IconsBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo Renis Santos on 26/03/25.
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
            .font(.largeTitle)
            //.resizable()
            // .aspectRatio(contentMode: .fit)
            // .scaledToFit()
            // .scaledToFill()
            // .font(.caption)
            // .font(.system(size: 200))
            .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
            // .frame(width: 300, height: 300)
            // .clipped()
    }
}

#Preview {
    IconsBootcamp()
}
