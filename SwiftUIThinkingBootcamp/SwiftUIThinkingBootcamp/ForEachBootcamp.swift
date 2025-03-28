//
//  ForEachBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 28/03/25.
//

import SwiftUI

struct ForEachBootcamp: View {
    let data: [String] = ["Hi", "Hello", "Hey everyone"]
    var body: some View {
        VStack {
            ForEach (0..<100) { index in
                Circle()
                    .fill(Color.blue)
                    .frame(height: 50)
            }
            
            // Using \.self tells Swift each item is uniquely identified using its own value. So, if you have the array [1,2,3] and identify each value by \.self it means the firs item has the identifier 1, the second 2, and the third.
            // https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
            ForEach(data.indices, id: \.self) { index in
                Text("\(data[index])")
            }
        }
    }
}

#Preview {
    ForEachBootcamp()
}
