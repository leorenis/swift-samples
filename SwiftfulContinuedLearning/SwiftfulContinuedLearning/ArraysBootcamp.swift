//
//  ArraysBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 02/06/25.
//

import SwiftUI

// Struct to training more about Arrays
struct ArraysBootcamp: View {
    // MARK: PROPERTIES
    @State private var vm = SampleArrayModificationViewModel()
    // MARK: BODY
    var body: some View {
        Text("Hello, Arrays!")
    }
}

// MARK: STRUCTS
struct SampleUserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

// MARK: VIEW MODELS
@Observable class SampleArrayModificationViewModel {
    var dataArray: [SampleUserModel] = []
    init() {
        getUsers()
    }
    
    func getUsers() {
        let users: [SampleUserModel] = [
            SampleUserModel(name: "John Doe", points: 100, isVerified: true),
            SampleUserModel(name: "Mary Doe", points: 80, isVerified: true),
            SampleUserModel(name: "Jane Frank", points: 10, isVerified: false),
            SampleUserModel(name: "Alex Sam", points: 30, isVerified: false),
            SampleUserModel(name: "Martin King", points: 90, isVerified: true),
            SampleUserModel(name: "LRS Sam", points: 190, isVerified: true),
            SampleUserModel(name: "LLS Sam", points: 191, isVerified: true),
            SampleUserModel(name: "Pablo Mike", points: 19, isVerified: false),
            SampleUserModel(name: "Lary Evans", points: 38, isVerified: true),
            SampleUserModel(name: "Peter Brown", points: 32, isVerified: false),
        ]
        self.dataArray.append(contentsOf: users)
    }
}

// MARK: PREVIEW
#Preview {
    ArraysBootcamp()
}
