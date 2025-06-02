//
//  HashableBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 02/06/25.
//

import SwiftUI

// Struct to training hashable.
struct HashableBootcamp: View {
    // MARK: PROPERTIES
    let data: [String] = ["ONE", "TWO", "THREE", "FOUR", "FIVE"]
    
    // MARK: BODY
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                }
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    HashableBootcamp()
}
