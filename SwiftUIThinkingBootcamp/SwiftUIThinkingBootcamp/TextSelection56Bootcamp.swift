//
//  TextSelection56Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 08/04/25.
//

import SwiftUI

struct TextSelection56Bootcamp: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Copy me!")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("On iOS, the person using the app touches and holds on a selectable Text view, which brings up a system menu with menu items appropriate for the current context. These menu items operate on the entire contents of the Text view; the person can’t select a range of text like they can on macOS.")
                    .textSelection(.enabled)
            }
            .textSelection(.enabled)
            .padding(20)
            .background(.ultraThinMaterial)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        .background(Color("AdaptiveColor"))
        
        
        
    }
}

#Preview {
    TextSelection56Bootcamp()
}
