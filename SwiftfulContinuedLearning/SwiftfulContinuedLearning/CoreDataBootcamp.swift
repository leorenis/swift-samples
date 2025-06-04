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
    init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data. \(error)")
            }
        }
    }
}

struct CoreDataBootcamp: View {
    // MARK: PROPERTIES
    @StateObject private var vm = CoreDataViewModel()
    
    // MARK: BODY
    var body: some View {
        
    }
}

#Preview {
    CoreDataBootcamp()
}
