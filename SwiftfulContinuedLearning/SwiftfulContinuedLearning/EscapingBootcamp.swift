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
}

// MARK: STRUCTS
struct EscapingBootcamp: View {
    // MARK: PROPERTIES
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text("Hello, Scaping!")
    }
}

// MARK: PREVIEW
#Preview {
    EscapingBootcamp()
}
