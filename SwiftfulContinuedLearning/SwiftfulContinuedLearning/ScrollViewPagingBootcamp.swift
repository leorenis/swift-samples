//
//  ScrollViewPagingBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 23/07/25.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10) { index in
                VStack(spacing: 30) {
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .overlay(Text("\(index)").foregroundStyle(.white))
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
