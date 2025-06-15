//
//  EscapingBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 14/06/25.
//  Episode: https://youtu.be/7gg8iBH2fg4?list=PLwvDm4VfkdpiagxAXCT33Rkwnc5IVhTar
//

import SwiftUI

// MARK: CLASSES
class EscapingViewModel: ObservableObject {
    @Published var title = "Hello"
    @Published var subtitle: String? = nil
    
    fileprivate func getData() {
        
        title = downloadDataSync()
        
        downloadDataClosure { (returnedData) in
            subtitle = returnedData
        }
        /// Another Problem: Reference to property 'text' in closure requires explicit use of 'self' to make capture semantics explicit
        /// solution: strong .self with the class EscapingViewModel. Ty by using [week self] to avoid issues such as memory leaks, slow apps and deinitialization.
        downloadDataAsyncWithDelay { [weak self] (returnData) in
            self?.title = returnData
            self?.subtitle = nil
        }
    }
    
    fileprivate func downloadDataSync() -> String {
        return "New data!"
    }
    
/// Problem: Does not works, because we cant do this in a synchronous context.
//    fileprivate func downloadData2() -> String {
//        // Delay 2 seconds
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            return "New data!"
//        }
//    }
    
    /// Try to Solution 1: Using callback function
    /// TIPS:
    ///  - (_ data: String) _ represents a alias for data typed as String outside the function.
    ///  - In Swift: Closure Functions that returns Void might be represented as: (_ data: String) -> Void, or (_ data: String) -> ()
    ///  - See more: https://youtu.be/7gg8iBH2fg4?list=PLwvDm4VfkdpiagxAXCT33Rkwnc5IVhTar&t=791
    fileprivate func downloadDataClosure(completionHandler: (_ data: String) -> Void) {
        completionHandler("Preparing to async")
    }
    
    /// Another Problem: Escaping closure captures non-escaping parameter 'completionHandler'
    /// Solution: @escaping
    fileprivate func downloadDataAsyncWithDelay(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data async!")
        }
    }
    
    
    /// Tips: Samples Void functions
    func doSomethingVoidFn() {}
    /// By using in closures
    func doSomethingVoidFnOne(_ data: String) -> () {}
    func doSomethingVoidFnTwo(_ data: String) -> Void {}
}

// MARK: STRUCTS
struct EscapingBootcamp: View {
    // MARK: PROPERTIES
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
        if let subtitle = vm.subtitle {
            Text(subtitle)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: PREVIEW
#Preview {
    EscapingBootcamp()
}
