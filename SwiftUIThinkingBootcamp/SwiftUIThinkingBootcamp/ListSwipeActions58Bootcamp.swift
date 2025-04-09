//
//  ListSwipeActions58Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 09/04/25.
//

import SwiftUI

struct ListSwipeActions58Bootcamp: View {
    
    // MARK: PROPERTIES
    @State var fruits: [String] = ["Apple", "Banana", "Orange", "Mango", "Pineapple"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .padding()
            }
            .swipeActions(edge: .trailing) {
                Button(action: { }) {
                    Label("Move", systemImage: "arrow.triangle.2.circlepath")
                }
                .tint(.blue)
                
                Button("Archive") {
                    // Action
                }
                .tint(.red)
                
                Button("Save") {
                    
                }
                .tint(.green)
            }
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                Button("Cancel") {
                    
                }.tint(.black)
            }
            // .onDelete(perform: delete)
        }
    }
}
// MARK: Preview
#Preview {
    ListSwipeActions58Bootcamp()
}


// MARK: FUNCTIONS
extension ListSwipeActions58Bootcamp {
    /// Delete a list item.
    ///
    /// This function perform a delete item feature.
    /// ```
    /// delete()
    /// ```
    ///
    /// - Parameter offsets: index from item to be removed.
    func delete(at offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }
}
