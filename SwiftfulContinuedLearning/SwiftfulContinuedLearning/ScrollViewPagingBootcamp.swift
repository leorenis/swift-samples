//
//  ScrollViewPagingBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 23/07/25.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    var body: some View {
//        VScrollViewTicTokUX()
        HScollViewUX()
    }
}

struct VScrollViewTicTokUX: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<10) { index in
                    Rectangle()
                        //.frame(width: 300, height: 300)
                        .overlay(Text("\(index)").foregroundStyle(.white))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .containerRelativeFrame(.vertical, alignment: .center)
                }
            }
        }
        .ignoresSafeArea()
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
        .scrollBounceBehavior(.basedOnSize)
    }
}

struct HScollViewUX: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(Text("\(index)").foregroundStyle(.white))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .containerRelativeFrame(.horizontal, alignment: .center)
                }
            }
        }
        .ignoresSafeArea()
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
