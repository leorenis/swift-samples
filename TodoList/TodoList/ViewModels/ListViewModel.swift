//
//  ListViewModel.swift
//  TodoList
//
//  Created by Leo on 22/04/25.
//
import Foundation

/// A class to provide data access for our tasks.
/// Tip: In iOS17+ there is a new way to do this.
///     - https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro
///     - https://github.com/leorenis/swift-samples/blob/main/SwiftUIThinkingBootcamp/SwiftUIThinkingBootcamp/Observable76Bootcamp.swift
///
class ListViewModel: ObservableObject {
    // MARK: PROPERTIES
    @Published var tasks: [TaskModel] = [] {    // Using Conputed Property
        didSet {                                // didSet gets called anytime we set this tasks
            saveTasks()
        }
    }
    let tasksListKey: String = "tasksListKey"
    
    init() {
        loadTasks()
    }
    
    /// Performs load method to create a list of fake tasks.
    ///
    ///```
    ///loadTasks()
    ///```
    ///
    /// - Complexity: O(m) on average, where m is the length of newElements, over many calls to append(contentsOf:) on the same array.
    ///
    private func loadTasks() {
//        let fakeTasks = [
//            TaskModel(title: "This the first task", isCompleted: true),
//            TaskModel(title:"This the second task", isCompleted: false),
//            TaskModel(title:"Third", isCompleted: false),
//        ]
//        tasks.append(contentsOf: fakeTasks)

//        When a guard is a failure, returns
//        guard let data = UserDefaults.standard.data(forKey: tasksListKey) else { return }
//        guard let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data) else { return }
        
        guard
            let data = UserDefaults.standard.data(forKey: tasksListKey),
            let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        
        self.tasks = savedTasks
    }
    
    /// Performs remove method in array to delete  some task at IndexSet from tasks array.
    ///
    ///```
    ///deleteTask(indexSet)
    ///```
    /// - Parameters:
    ///    - index : this is the IndexSet
    ///
    /// - Complexity: O(*n*) where *n* is the length of the collection.
    ///
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    /// Moves all the elements at the specified offsets to the specified destination offset, preserving ordering.
    ///
    ///```
    ///moveTask(from, to)
    ///```
    /// - Parameters:
    ///   - source: An index set representing the offsets of all elements that
    ///     should be moved.
    ///   - destination: The offset of the element before which to insert the
    ///     moved elements. `destination` must be in the closed range
    ///     `0...count`.
    ///
    /// - Complexity: O(*n* log *n*), where *n* is the length of the collection.
    func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    /// Performs create method to append new task in array.
    ///
    ///```
    ///createTask(title: "Title new task")
    ///```
    /// - Parameters:
    ///    - title : title for a new task
    ///
    /// - Complexity: O(1) on average, over many calls to append(_:) on the same array.
    ///
    func createTask(title: String) {
        let newTask = TaskModel(title: title, isCompleted: false)
        tasks.append(newTask)
    }
    
    /// Performs update method to update the clicked task.
    ///
    ///```
    ///updateTask(task: TaskModel)
    ///```
    /// - Parameters:
    ///    - task : task to be  updated
    ///
    /// - Complexity: O(n), where n is the length of the collection.
    ///
    func updateTask(task: TaskModel) {
//        if let index = tasks.firstIndex(where: { (existingTask) -> Bool in
//            return existingTask.id == task.id
//        }) {
//            // run the code
//        }

        // Short sintax
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index] = task.toggleCompletion()
        }
        
    }
    
    /// Saves data tasks in user defaults better experience and use in the next session.
    ///
    ///```
    ///saveTasks()
    ///```
    ///
    /// - Complexity: O(1), saves key value in user defaults.
    ///
    func saveTasks() {
        /// The example below shows how to encode an instance of a simple GroceryProduct type from a JSON object.
        /// The type adopts Codable so that it’s encodable as JSON using a JSONEncoder instance.
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksListKey)
        }
    }
}

/// Importante:
///     - @AppStorage should be used if you're going to use it in the view directly;
///     - Since we're in a class, it's better to use  User Defaults.
