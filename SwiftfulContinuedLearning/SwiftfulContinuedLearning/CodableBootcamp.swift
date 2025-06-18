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
    var customer: CustomerModel? = CustomerModel(id: "1", name: "Nick Doe", points: 5, isPremium: true)
}

// MARK: STRUCTS VIEWS
/// Structs to learning and training Codable protocol.
struct CodableBootcamp: View {
    
    // MARK: PROPERTIES
    @State private var vm = CodableViewModel()
    
    // MARK: BODY
    var body: some View {
        Text("Hello, Codable!")
    }
}

// MARK: PREVIEW
#Preview {
    CodableBootcamp()
}
