//
//  GridBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 28/03/25.
//

import SwiftUI

struct GridBootcamp: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 4, alignment: nil), // Case Horizontal: change to GridRow : 22:00 swiftfullthinking
        GridItem(.flexible(), spacing: 4, alignment: nil),
        GridItem(.flexible(), spacing: 4, alignment: nil),
    ]
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.orange)
                .frame(height: 400)
            // Case Horizontal: change to LazyHGrid
            LazyVGrid(
                columns: columns, // Case Horizontal: change to rows
                alignment: .center,
                spacing: 4,
                pinnedViews: [.sectionHeaders],
                content: {
                    let sections: [String] = ["Section 1", "Section 2"]
                    // Using \.self tells Swift each item is uniquely identified using its own value. So, if you have the array [1,2,3] and identify each value by \.self it means the firs item has the identifier 1, the second 2, and the third.
                    // https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
                    ForEach(sections, id: \.self) { setion in
                        Section(
                            header: Text("Section 1")
                                .foregroundColor(Color.white)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.blue)
                                .padding()
                        ) {
                            ForEach(0..<20) { _ in
                                Rectangle().frame(height: 150)
                            }
                        }
                    }
                }
            )
        }
    }
}

#Preview {
    GridBootcamp()
}
