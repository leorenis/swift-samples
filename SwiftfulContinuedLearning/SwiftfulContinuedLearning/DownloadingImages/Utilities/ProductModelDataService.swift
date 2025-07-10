//
//  ProductModelDataService.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 08/07/25.
//

import Foundation
import Combine

class ProductModelDataService {
    
    /// Shared singleton instance of `ProductModelDataService`.
    ///
    /// Use this property to access the centralized instance of the data service throughout the app.
    /// This ensures a single, shared source of truth for all product-related data operations.
    ///
    /// ```swift
    /// let service = ProductModelDataService.instance
    /// ```
    ///
    /// - Note: This follows the singleton design pattern to maintain a single instance across the application lifecycle.
    static let instance = ProductModelDataService()
    
    @Published var productModels: [ProductModel] = []
    var cancellables = Set<AnyCancellable>()
    
    /// Prevents external instantiation to enforce the singleton pattern.
    private init() {
        downloadData()
    }
    
    /// Downloads product data from a remote API and updates the `productModels` property.
    ///
    /// This method performs a network request to fetch a list of products with selected fields.
    /// The request runs on a background thread and the response is handled on the main thread.
    /// On success, the decoded `[ProductModel]` array is stored in `productModels`.
    /// On failure, an error message is printed to the console.
    ///
    /// - Note: This method uses Combine's `dataTaskPublisher` and stores the subscription in `cancellables`.
    func downloadData() {
        let stringURL = "https://dummyjson.com/products?limit=30&skip=30&select=title,price,thumbnail,price"
        guard let url = URL(string: stringURL) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: ProductEnvelopeModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data: \(error)")
                }
            } receiveValue: { [weak self] (returnedProductModels) in
                // print(returnedProductModels.products)
                self?.productModels = returnedProductModels.products
            }
            .store(in: &cancellables)
    }
    
    /// Validates the HTTP response and returns the data if the response is successful.
    ///
    /// - Parameter output: The output from a `URLSession.DataTaskPublisher`, containing the response and data.
    /// - Returns: The raw `Data` from the response if the status code is in the 2xx range.
    /// - Throws: A `URLError.badServerResponse` if the response is not a valid HTTP 2xx status.
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
