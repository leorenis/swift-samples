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
    @Published var text = "Hello"
    
    fileprivate func getData() {
        downloadDataAsync { (returnedData) in
            text = returnedData
        }
    }
    
    fileprivate func downloadData() -> String {
        return "New data!"
    }
    
/// Problem: Does not works, because we cant do this in a synchronous context.
//    fileprivate func downloadData2() -> String {
//        // Delay 2 seconds
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            return "New data!"
//        }
//    }
    
    /// Solution: Using callback function
    /// TIPS:
    ///  - (_ data: String) _ represents a alias for data typed as String outside the function.
    ///  - In Swift: Closure Functions that returns Void might be represented as: (_ data: String) -> Void, or (_ data: String) -> ()
    ///  - See more: https://youtu.be/7gg8iBH2fg4?list=PLwvDm4VfkdpiagxAXCT33Rkwnc5IVhTar&t=791
    fileprivate func downloadDataAsync(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data!")
    }
    
    /// Sample Void functions
    func doSomethingVoidFn() {}
    func doSomethingVoidFnOne(_ data: String) -> () {}
    func doSomethingVoidFnTwo(_ data: String) -> Void {}
}

// MARK: STRUCTS
struct EscapingBootcamp: View {
    // MARK: PROPERTIES
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

// MARK: PREVIEW
#Preview {
    EscapingBootcamp()
}
