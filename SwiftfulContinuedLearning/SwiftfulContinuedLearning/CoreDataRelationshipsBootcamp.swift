//
//  CoreDataRelationshipsBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 06/06/25.
//

import SwiftUI
import CoreData

//MARK: CLASSES
class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    private init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data \(error)")
            }
        }
        context = container.viewContext
    }
    
    fileprivate func save() {
        do {
            try context.save()
        } catch let error {
            print("Error saving Core Data \(error)")
        }
    }
}

class CoreDataRelationshipViewModel: ObservableObject {
    
}

// MARK: STRUCTS
/// Struct to learning relationships in core data.
struct CoreDataRelationshipsBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = CoreDataRelationshipViewModel()
    
    // MARK: BODY
    var body: some View {
        Text("Hello, Relationship!")
    }
}

// MARK: PREVIEW
#Preview {
    CoreDataRelationshipsBootcamp()
}
