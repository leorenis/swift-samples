//
//  CoreDataRelationshipsBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 06/06/25.
//

import SwiftUI
import CoreData

/**
 * 3 Entities
 * BusinessEntity
 * DepartmentEntity
 * EmployeeEntity
 */

//MARK: CLASSES
/// Class to represents a Singleton Pattern to CoreDataManager
class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    private init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
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
            print("Saved successfully")
        } catch let error {
            print("Error saving Core Data \(error.localizedDescription)")
        }
    }
}

/// Class to represents View Model
class CoreDataRelationshipViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var businesses: [BusinessEntity] = []
    
    fileprivate func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Appl2 Inc."
        save()
    }
    
    fileprivate func save() {
        manager.save()
    }
}

// MARK: STRUCTS
/// Struct to learning relationships in core data.
struct CoreDataRelationshipsBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = CoreDataRelationshipViewModel()
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    Button(action: {
                        vm.addBusiness()
                    }, label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    })
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

// MARK: PREVIEW
#Preview {
    CoreDataRelationshipsBootcamp()
}
