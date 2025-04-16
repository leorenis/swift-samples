//
//  InitializerBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 28/03/25.
//

import SwiftUI

enum Fruit: String, CaseIterable {
    case apple, orange, peaches
    var title: String {
        switch self {
        case .apple: return "Apples"
        case .orange: return "Oranges"
        case .peaches: return "Peaches"
        }
    }
}

struct ContentModel {
    let backgroundColor: Color
    let count: Int
    let fruit: Fruit
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        self.fruit = fruit
        
        if fruit == Fruit.apple {
            self.backgroundColor = .red
        } else {
            self.backgroundColor = .orange
        }
    }
}

struct InitializerBootcamp: View {
    
    let contentModel: ContentModel

    var body: some View {
        VStack(spacing: 12) {
            Text("\(contentModel.count)")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .underline()

            Text(contentModel.fruit.title)
                .font(.headline)
                .foregroundColor(Color.white)
               
        }
        .frame(width: 150, height: 150)
        .background(contentModel.backgroundColor)
        .cornerRadius(10) // This HAVE to came AFTER background...
    }
}

#Preview {
    HStack {
        InitializerBootcamp(contentModel: ContentModel(count: 55, fruit: Fruit.apple))
        InitializerBootcamp(contentModel: ContentModel(count: 46, fruit: Fruit.orange))
    }
}
