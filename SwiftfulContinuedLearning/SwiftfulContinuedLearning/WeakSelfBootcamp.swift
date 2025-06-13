//
//  WeakSelfBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 13/06/25.
//

import SwiftUI

// MARK: CLASSES
class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("Initialized now")
        getData()
    }
    
    deinit {
        print("Deinitialized now")
    }
    
    func getData() {
        data = "NEW DATA!!!!"
    }
}

// MARK: STRUCTS
/// Struct to learning weak self
struct WeakSelfBootcamp: View {
    // MARK: BODY
    var body: some View {
        NavigationStack {
            NavigationLink(
                "Navigate",
                destination: WeakSelfSecondScreen()
            )
            .navigationTitle("Screen One")
        }
    }
}

struct WeakSelfSecondScreen: View {
    var body: some View {
        Text("Second View")
            .font(.title)
            .foregroundStyle(.red)
    }
}

// MARK: PREVIEW
#Preview {
    WeakSelfBootcamp()
}
