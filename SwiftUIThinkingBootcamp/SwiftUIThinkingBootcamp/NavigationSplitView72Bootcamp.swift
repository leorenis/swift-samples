//
//  NavigationSplitView72Bootcamp.swift
//  SwiftUIThinkingBootcamp
//  Episode: https://youtu.be/Ua37Oof6H1Q?si=GAgopSZnqJ96mkm2
//  Created by Leo on 16/04/25.
//
// NavigationSplitView -> iPad, MacOS, VisionOS

import SwiftUI

/// A data struct to provide struct to practicing NavigationSplitView.
struct NavigationSplitView72Bootcamp: View {
    
    // MARK: PROPERTIES
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var selectedCategory: FoodCategory? = nil
    @State private var selectedFruit: Fruit? = nil
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $visibility) {
            /**
             * Refactoring: Changing List to act as a ForEach passing Binding selection: $selectedItem. This is amazing, because turn List able shows both on iPad and iPhone experiences. This is Amazing!
             */
            List(FoodCategory.allCases, id: \.rawValue, selection: $selectedCategory) { category in
                NavigationLink(category.rawValue.capitalized, value: category)
//                Button(category.rawValue.capitalized) {
//                    selectedCategory = category
//                    selectedFruit = nil
//                }
            }

//            List {
//                ForEach(FoodCategory.allCases, id: \.self) { category in
//                    Button(category.rawValue.capitalized) {
//                        selectedCategory = category
//                        selectedFruit = nil
//                    }
//                }
//            }
            .navigationTitle("All categories")
        } content: {
            if let selectedCategory {
                Group {
                    switch selectedCategory {
                    case .fruits:
                        List(Fruit.allCases, id: \.rawValue, selection: $selectedFruit) { fruit in
                            NavigationLink(fruit.rawValue.capitalized, value: fruit)
//                            Button(fruit.rawValue.capitalized) {
//                              selectedFruit = fruit
//                            }
                        }
                    default:
                        EmptyView() // To be implemented
                    }
                }.navigationTitle("Categories")
            } else {
                Text("Please select a category.")
            }
        }
        detail: {
            if let selectedFruit {
                Text("You selected: \(selectedFruit.rawValue.capitalized)")
                    .font(.headline)
                    .navigationTitle(selectedFruit.rawValue.capitalized)
            } else {
                Image(systemName: "hand.rays")
                    .font(.system(size: 52))
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
                    
            }
        }
        .navigationSplitViewStyle(.balanced)
        
    }
}

// MARK: PREVIEW
#Preview {
    NavigationSplitView72Bootcamp()
}

/// A enum to provide options key. The main goal is avoid magic constants in the code.
///
enum FoodCategory: String, CaseIterable {
    case fruits, vegetables, meats
}

