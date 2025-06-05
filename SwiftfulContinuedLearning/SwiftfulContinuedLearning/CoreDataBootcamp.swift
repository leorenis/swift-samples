//
//  CoreDataBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 04/06/25.
//

import SwiftUI
import CoreData

// View - UI
// Model - data point
// ViewModel - manages the data for a view

// MARK: CLASSES
class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data. \(error)")
            }
        }
        fetchFruits()
    }
    
    fileprivate func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching fruits. \(error)")
        }
    }
    
    fileprivate func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    fileprivate func addFruit(text: String) {
        print("Saving..")
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving data. \(error)")
        }
    }
}

/// Struct used to learn CoreData
struct CoreDataBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = CoreDataViewModel()
    @State private var fruitText: String = ""
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Add a fruit", text: $fruitText)
                    .frame(height: 55)
                    .padding(.leading)
                    .font(.headline)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal)
                
                Button {
                    guard fruitText.count > 3 else { return }
                    vm.addFruit(text: fruitText)
                    fruitText = ""
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.horizontal)
                
                List {
                    ForEach(vm.savedEntities) { entity in
                        let noName = "No name"
                        let name = entity.name ?? noName
                        let noEmptyName = name.isEmpty ? noName : name
                        Text(noEmptyName)
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataBootcamp()
}
