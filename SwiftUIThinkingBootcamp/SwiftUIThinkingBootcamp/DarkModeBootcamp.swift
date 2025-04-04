//
//  DarkModeBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 03/04/25.
//

import SwiftUI

struct DarkModeBootcamp: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 20) {
                    Text("This text is Primary")
                        .foregroundStyle(.primary)
                    Text("This text is secundary")
                        .foregroundStyle(.secondary)
                    Text("This text is black")
                        .foregroundStyle(.black)
                    Text("This text is white")
                        .foregroundStyle(.white)
                    Text("This text is RED")
                        .foregroundStyle(.red)
                    Text("This text is Adaptative")
                        .foregroundStyle(Color("AdaptiveColor")) // Provided by assets
                    Text("This text is locally adaptive!")
                        .foregroundStyle(colorScheme == .light ? .green : .yellow)
                    
                }
            }.navigationTitle(Text("Dark Mode Bootcamp"))
        }
    }
}

#Preview {
    DarkModeBootcamp()
}
