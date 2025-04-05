//
//  ViewModel50Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 05/04/25.
//

import SwiftUI

/// A data struct to provide a Model of Fruits.
///
struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}


struct ViewModel50Bootcamp: View {
    
    // MARK: PROPERTIES
    @State var fruits: [FruitModel] = []
    
    /// View Body: block is responsable for acts as entry point in this view
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(fruits) { fruit in
                    HStack {
                        Text(fruit.name)
                        Spacer()
                        Text("\(fruit.count)")
                            .font(.headline)
                            .foregroundStyle(.primary.opacity(0.5))
                    }
                }
                .onDelete(perform: deleteFruit)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(Text("Fruits"))
            .onAppear {
                fillFruits()
            }
        }
    }
    
    // MARK: FUNCTIONS
    
    /// fill a fruits array with contentsOf some fruits.
    ///
    /// This function fills the state fruits array. e.g.
    /// ```
    /// fillFruits()
    /// ```
    ///
    /// - Warning: There is just a mock helper method. This docs have studying and training porpose.
    func fillFruits() {
        let fruitOne = FruitModel(name: "Apple", count: 2)
        let fruitTwo = FruitModel(name: "Orange", count: 6)
        let fruitThree = FruitModel(name: "Peaches", count: 4)
        let fruitFour = FruitModel(name: "Grapes", count: 20)
        let fruitFive = FruitModel(name: "Watermelon", count: 1)
        let fruitSix = FruitModel(name: "Banana", count: 9)
        
        fruits.append(contentsOf: [fruitOne, fruitTwo, fruitThree, fruitFour, fruitFive, fruitSix])
    }
    
    /// performs remove method in array to delete  some fruit at IndexSet from fruits array.
    ///
    ///```
    ///deleteFruit(index)
    ///```
    /// - Parameters index : this is the IndexSet
    /// - Complexity: O(*n*) where *n* is the length of the collection.
    ///
    func deleteFruit(indexOffSet: IndexSet) {
        fruits.remove(atOffsets: indexOffSet)
    }
}

// MARK: PREVIEW
#Preview {
    ViewModel50Bootcamp()
}
