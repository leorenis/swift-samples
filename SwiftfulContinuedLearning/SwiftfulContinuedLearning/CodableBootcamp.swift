//
//  CodableBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 17/06/25.
//

import SwiftUI

/**
 * Codable = Decodable + Encodable.
 *
 * A type that can convert itself into and out of an external representation.
 * ```
 *  typealias Codable = Decodable & Encodable
 * ```
 */

// MARK: MODELS
struct CustomerModel: Identifiable, Codable {
    
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool

    /// Wooow! The Codable great Job! Bellow Nick shows up how to do using Decodable + Encodable. But just changing the protocol to Codable, all this code is not necessary anymore.
//    enum CodingKeys: String, CodingKey {
//        case id, name, points, isPremium
//    }
//    
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
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
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//            let dictionary = localData as? [String: Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool {
//            
//            let newCustomer = CustomerModel(id: id, name: name , points: points, isPremium: isPremium)
//            customer = newCustomer
        
        /// Solution: Codable. Both approach works. I prefer the explicity second one.
//        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        do {
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        } catch let error {
            print("Error decoding. \(error)")
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
        let customer = CustomerModel(id: "af2f-dac1-bfa3-1cbd2e5e8e4f", name: "Mary Jane Smith", points: 9, isPremium: true)
        return try? JSONEncoder().encode(customer)
//        let dictionary: [String:Any] = [
//            "id": "af2f-dac1-bfa3-1cbd2e5e8e4f",
//            "name": "Mary Jane Smith",
//            "points": 7,
//            "isPremium": true
//        ]
//        return try? JSONSerialization.data(withJSONObject: dictionary, options: [])
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
