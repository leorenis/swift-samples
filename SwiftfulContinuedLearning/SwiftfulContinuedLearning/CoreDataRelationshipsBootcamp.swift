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
    private let container: NSPersistentContainer
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
    
    init() {
        fetchBusinesses()
    }
    
    fileprivate func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Appl2 Inc."
        
        // add existing departments to the new business
        // newBusiness.departments = []
        
        // add existing employee to the new business
        // newBusiness.employees = []
        
        // add new business to existing department
        // newBusiness.addToDepartments(<#T##value: DepartmentEntity##DepartmentEntity#>)
        
        // add new business to existing employee
        // newBusiness.addToEmployees(<#T##value: EmployeeEntity##EmployeeEntity#>)
        save()
    }
    
    fileprivate func addDepartment() {
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = "Engineering"
        newDepartment.businesses = [businesses[0]]
        save()
        
    }
    
    fileprivate func save() {
        businesses.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.fetchBusinesses()
        }
    }
    
    fileprivate func fetchBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching data \(error.localizedDescription)")
        }
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
                        //vm.addBusiness()
                        vm.addDepartment()
                    }, label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    ScrollView (.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    })
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

/// Struct responsible to show BusinessView
struct BusinessView: View {
    let entity: BusinessEntity
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Name: \(entity.name ?? "No name")")
                .bold()
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments:")
                    .bold()
                ForEach(departments) { department in
                    Text(department.name ?? "No name")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees: ")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "no name")
                }
            }
        })
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
}

/// Struct responsible to show DepartmentView
struct DepartmentView: View {
    let entity: DepartmentEntity
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Name: \(entity.name ?? "No name")")
                .bold()
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Businesses:")
                    .bold()
                ForEach(businesses) { business in
                    Text(business.name ?? "No name")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees: ")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "no name")
                }
            }
        })
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
}

// MARK: PREVIEW
#Preview {
    CoreDataRelationshipsBootcamp()
}
