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
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("Deinitialized now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    /// Situation:
    ///    When we are using this aproach, only setting data instantaneally, everithing works fine.
    ///         But when we simulate a real world scenario, where some latency appers, the user can opens screen and get out before the new data is completely loaded. Let's simulate right now using DispatchQueue.
    ///    In this case we have a problem, and a possible door for memory leaks. E.g.
    ///
    /// ```
    ///     DispatchQueue.main.asyncAfter(deadline: .now() + 1000) {
    ///         self.data = "NEW DATA!!!!"
    ///     }
    /// ```
    ///
    /// Solution: Using [weak self] in our closure to remove strong reference to view model class.
    ///
    /// ```
    ///     DispatchQueue.main.asyncAfter(deadline: .now() + 1000) { [weak self] in
    ///         self?.data = "NEW DATA!!!!"
    ///     }
    /// ```
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "NEW DATA!!!!"
        }
    }
}

// MARK: STRUCTS
/// Struct to learning weak self
struct WeakSelfBootcamp: View {
    // MARK: PROPERTIES
    @AppStorage("count") var count: Int?
    
    init () {
        count = 0
    }
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            NavigationLink(
                "Navigate",
                destination: WeakSelfSecondScreen()
            )
            .navigationTitle("Screen One")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.title)
                .padding()
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            , alignment: .topTrailing)
    }
}

struct WeakSelfSecondScreen: View {
    // MARK: PROPERTIES: SECOND
    // Gootch, I forget put @State instead @StateObject. And I HAD a BIG BUUUG. I need to PAY ATENTION
    @StateObject private var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.title)
                .foregroundStyle(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    WeakSelfBootcamp()
}
