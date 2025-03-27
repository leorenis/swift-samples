//
//  FrameBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 26/03/25.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        /*
         Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(Color.green)
            // .frame(width: 300, height: 300, alignment: .center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.red)
         */
        Text("Hello, World!")
            .background(Color.red)
            .frame(height: 100, alignment: .top)
            .background(Color.orange)
            .frame(width: 150)
            .background(Color.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.pink)
            .frame(height: 400)
            .background(Color.green)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.yellow)
        
    }
}

#Preview {
    FrameBootcamp()
}
