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

/// A class to provide data access for our fruits.
///
class FruitViewModel: ObservableObject {
    // @Published: for now, this is the same thing as the @State (struct), except it's whitin a class.
    @Published var fruits: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        fillFruits()
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
        
        // This is just to simulate a slowly database load...
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.fruits.append(contentsOf: [fruitOne, fruitTwo, fruitThree, fruitFour, fruitFive, fruitSix])
            self.isLoading = false
        }
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

struct ViewModel50Bootcamp: View {
    
    // MARK: PROPERTIES
    
    /**
     * Generic struct 'ObservedObject' requires that 'FruitViewModel' conform to 'ObservableObject'. E.g. FruitViewModel: ObservableObject
     *
     * Important Tip: When object fruitViewModel changes, this observed will change as well. But, if this current view change? In this case, you should use @StateObject instead @ObservedObject.
     *
     * @StateObject -> USE THIS ON CREATION or INIT.
     * @ObservedObject -> USE THIS FOR SUBVIEWS. E.g. FruitDetailView
     */
    // @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    // @State var fruits: [FruitModel] = []
    
    /// View Body: block is responsable for acts as entry point in this view.
    var body: some View {
        NavigationStack {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(fruitViewModel.fruits) { fruit in
                        NavigationLink(
                            destination: FruitDetailView(
                                selected: fruit,
                                fruitViewModel: fruitViewModel
                            )) {
                            HStack {
                                Text("\(fruit.count)")
                                    .font(.headline)
                                    .foregroundStyle(.primary.opacity(0.5))
                                Text(fruit.name)
                            }
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Fruits")
            /*.onAppear {
                fruitViewModel.fillFruits() // Prefer fillFruits() on init from fruitViewModel
            }*/
        }
    }
}

/// A  struct to provide Fuit Details View.
/// - Parameter selected: current fruit in visualization.
/// - Parameter fruitViewModel: @ObservedObject to provide array of Fruits in SubView.
///
struct FruitDetailView: View {
    
    // MARK: PROPERTIES
    let selected: FruitModel
    @ObservedObject var fruitViewModel: FruitViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Background color
            Color("AdaptiveColor")
                .ignoresSafeArea(edges: .all)
            
          // Content layer
            VStack {
                Text("Fruit detail 🍉")
                    .font(.title)
                    .foregroundStyle(.secondary)
                
                Text("Fruit: \(selected.name) - \(selected.count)")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 4)
                
                Text("All fruits: \(fruitViewModel.fruits.map(\.name).joined(separator: ", "))")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Button  {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("< Back to home")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .padding()
                }
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    ViewModel50Bootcamp()
}
