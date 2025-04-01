//
//  ExtractSubviewsBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 29/03/25.
//

import SwiftUI

struct BasketFruit: Identifiable {
    var id: Int
    let title: String
    let count: Int
    let color: Color
}

struct ItemVStackView: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.title)
            Text("\(title)")
                .font(.callout)
        }
        .foregroundColor(.white)
        .padding()
        .background(color)
        .cornerRadius(8)
    }
}

struct ExtractSubviewsBootcamp: View {
    let baskets: [BasketFruit] = [
        BasketFruit(id: 1, title: "Apples", count: 3, color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))),
        BasketFruit(id: 2, title: "Oranges", count: 8, color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))),
        BasketFruit(id: 3, title: "Banana", count: 5, color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))),
    ]
    // Body
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)).ignoresSafeArea(.all)
            
            // Content Layer
           contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            ForEach(baskets) { basket in
                ItemVStackView(
                    title: basket.title,
                    count: basket.count,
                    color: basket.color
                )
            }
        }
    }
}

#Preview {
    ExtractSubviewsBootcamp()
}

