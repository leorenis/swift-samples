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
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE"),
    ]
    
    // MARK: BODY
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

// MARK: STRUCTS
struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

// MARK: PREVIEW
#Preview {
    HashableBootcamp()
}
