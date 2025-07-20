//
//  AlignmentGuideBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 20/07/25.
//

import SwiftUI

struct AlignmentGuideBootcamp: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Hello!")
                .background(.blue)
            
            Text("Another text AlignementGuide")
                .background(.red)
        }
        .background(.orange)
    }
}

#Preview {
    AlignmentGuideBootcamp()
}
