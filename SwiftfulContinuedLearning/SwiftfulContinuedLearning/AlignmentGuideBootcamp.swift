//
//  AlignmentGuideBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 20/07/25.
//

import SwiftUI

struct AlignmentGuideBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello!")
                .background(.blue)
//                .padding(.leading, 10)
//                .offset(x: -10)
                .alignmentGuide(.leading) { dimension in
                    return dimension.width * 0.5
                }
            
            Text("Another text AlignementGuide")
                .background(.red)
        }
        .background(.orange)
    }
}

struct AlignmentChildView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            row(title: "First row", showIcon: false)
            row(title: "Second row", showIcon: true)
            row(title: "Third row", showIcon: false)
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 8)
        .padding(40)
        
    }
    
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
//            Image(systemName: "info.circle")
//                .frame(width: 30, height: 30)
//                .opacity(showIcon ? 1 : 0)
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            
            Text(title)
            Spacer()
        }
//        .background(.red)
        .alignmentGuide(.leading) { dimension in
            return showIcon ? 40 : 0
        }
    }
}

#Preview {
    AlignmentChildView()
}
