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
    
    func getData() {
        data = "NEW DATA!!!!"
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
