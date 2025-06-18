//
//  CodableBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 17/06/25.
//

import SwiftUI

// MARK: MODELS
struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
}

// MARK: CLASSES VIEW MODELS
@Observable class CodableViewModel {
    fileprivate var customer: CustomerModel? = nil // CustomerModel(id: "1", name: "Nick Doe", points: 5, isPremium: true)
    
    init () {
        fetchData()
    }
    
    
    /// Simulates a method to get data.
    ///
    /// Inicialize data fetch method.
    ///
    /// ```swift
    ///    fetchData()
    /// ```
    ///
    /// We can see Data as JSON using:
    ///
    ///```swift
    ///     let jsonAsString = String(data: data, encoding: .utf8)
    ///```
    ///
    /// - Complexity:
    ///     O(1) on average, always contant.
    fileprivate func fetchData() {
        guard let data = getJSONData() else { return }
        /// Hmm: this kind of code is tediously, so boring.
        /// Solution: Codable
        if
            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
            let dictionary = localData as? [String: Any],
            let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let points = dictionary["points"] as? Int,
            let isPremium = dictionary["isPremium"] as? Bool {
            
            let newCustomer = CustomerModel(id: id, name: name , points: points, isPremium: isPremium)
            customer = newCustomer
        }
    }
    
    
    /// Simulates a data fetch from the internet as JSON Object.
    ///
    /// Gets remote data and return as optional Data
    ///
    ///     getJSONData() -> Data?
    ///
    /// - Returns: Returts an optional data from Data type
    fileprivate func getJSONData() -> Data? {
        let dictionary: [String:Any] = [
            "id": "af2f-dac1-bfa3-1cbd2e5e8e4f",
            "name": "Mary Jane Smith",
            "points": 7,
            "isPremium": true
        ]
        return try? JSONSerialization.data(withJSONObject: dictionary, options: [])
    }
}

// MARK: STRUCTS VIEWS
/// Structs to learning and training Codable protocol.
struct CodableBootcamp: View {
    
    // MARK: PROPERTIES
    @State private var vm = CodableViewModel()
    
    // MARK: BODY
    var body: some View {
        VStack(alignment: .leading ,spacing: 20) {
            if let customer = vm.customer {
                Group {
                    Text("ID: \(customer.id)")
                    Text("Name: \(customer.name)")
                    Text("\(customer.points) points")
                    Text(customer.isPremium ? "Premium 🫅🏾" : "Not Premium")
                }
                .font(.headline)
                
            } else {
                Text("∅")
            }
        }
        .padding()
        .padding(.horizontal, 20)
        .background(Color.green.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

// MARK: PREVIEW
#Preview {
    CodableBootcamp()
}
