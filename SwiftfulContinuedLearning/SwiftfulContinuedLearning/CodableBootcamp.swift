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
    fileprivate var customer: CustomerModel? = CustomerModel(id: "1", name: "Nick Doe", points: 5, isPremium: true)
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
