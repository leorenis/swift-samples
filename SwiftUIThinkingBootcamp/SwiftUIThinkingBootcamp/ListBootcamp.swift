//
//  ListBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 31/03/25.
//

import SwiftUI

struct ListBootcamp: View {
    @State var fruits: [String] = ["Apple", "Banana", "Orange", "Mango", "Peaches"]
    @State var veggies: [String] = ["Carrot", "Broccoli", "Spinach", "Kale", "Bell Pepper"]
    
    var body: some View {
        
        // Use NavigationStack and NavigationSplitView instead. For more information, see Migrating to new navigation types.
        NavigationStack {
            List {
                Section(
                    header: Text("Fruits"),
                    content: {
                        ForEach(fruits, id: \.self) { fruit in
                            Text(fruit.capitalized)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    })
                
                Section(
                    header: Text("Veggies")) {
                        ForEach(veggies, id: \.self) { veggie in
                            Text(veggie.capitalized)
                        }
                    }
            }
            //.listStyle(GroupedListStyle())
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                   addButton
               }
            }
            // .tint(.red)
        }
        
    }
    
    var addButton: some View {
        Button("Add") {
            add()
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffSet: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffSet)
    }
    
    func add () {
        fruits.append("Coconut")
    }
}

#Preview {
    ListBootcamp()
}
