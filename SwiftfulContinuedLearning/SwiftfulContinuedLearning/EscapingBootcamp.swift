//
//  EscapingBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 14/06/25.
//

import SwiftUI

// MARK: CLASSES
class EscapingViewModel: ObservableObject {
    @Published var text = "Hello"
    
    fileprivate func getData() {
        let newData = downloadData()
        text = newData
    }
    
    fileprivate func downloadData() -> String {
        return "New data!"
    }
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
