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

#Preview {
    AlignmentGuideBootcamp()
}
