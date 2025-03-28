//
//  ScrollViewBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leoon 28/03/25.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
        /*
         ScrollView(.vertical, showsIndicators: true, content: {
            VStack {
                ForEach(0..<50) { _ in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 300)
                }
            }
        })
        */
        
        // multiples scrool view
        ScrollView(.vertical, showsIndicators: false, content: {
            ForEach(0..<50){ vindex in
                LazyVStack {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(0..<20) { hindex in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay(
                                        Text("ROW \(vindex) | COL \(hindex)")
                                            .font(.title)
                                            .foregroundStyle(.gray)
                                    )
                            }
                        }
                    })
                }
            }
        })
    }
}

#Preview {
    ScrollViewBootcamp()
}
