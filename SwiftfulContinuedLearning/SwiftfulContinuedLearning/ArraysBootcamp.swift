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
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.filteredArray) { user in
                    VStack (alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        HStack {
                            Text("Points: \(user.points)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "flame.fill")
                                    
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal)
                }
                Divider()
                
                Text("Total points: \(vm.totalPoints)")
                Text(vm.mappedArray.joined(separator: ", "))
            }
        }
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
    var filteredArray: [SampleUserModel] = []
    var mappedArray: [String] = []
    var totalPoints: Int = 0
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    private func getUsers() {
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
    
    private func updateFilteredArray() {
        // sort
//        filteredArray = dataArray.sorted(by: { user1, user2 in
//            return user1.points > user2.points
//        })
//        filteredArray = dataArray.sorted { $0.points > $1.points }
        
        // filter
//        filteredArray = dataArray.filter({ user -> Bool in
//            return user.isVerified
//        })
        filteredArray = dataArray.filter { $0.isVerified }
        
        // map
//        mappedArray = dataArray.map({ user -> String in
//            return user.name
//        })
        mappedArray = filteredArray.map { $0.name }
        mappedArray = filteredArray.compactMap({ user -> String? in
            return user.name
        })
        mappedArray = dataArray.sorted{$0.points > $1.points}.filter{$0.isVerified}.compactMap(\.name)
        
        // Reduce
        totalPoints = filteredArray.reduce(into: 0) { result, user in
            return result += user.points
        }
    }
}

// MARK: PREVIEW
#Preview {
    ArraysBootcamp()
}
