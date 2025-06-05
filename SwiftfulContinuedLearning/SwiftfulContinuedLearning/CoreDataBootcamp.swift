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
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching fruits. \(error)")
        }
    }
}

/// Struct used to learn CoreData
struct CoreDataBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = CoreDataViewModel()
    
    // MARK: BODY
    var body: some View {
        Text("Hello, Core Data!")
    }
}

#Preview {
    CoreDataBootcamp()
}
