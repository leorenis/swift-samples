//
//  DownloadingImagesViewModel.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 08/07/25.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    @Published var dataArray: [ProductModel] = []
    let dataService = ProductModelDataService.instance
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        addSubscribers()
    }
    
    /// Subscribes to changes in `productModels` from the `ProductModelDataService` and updates `dataArray`.
    ///
    /// This method observes the `productModels` published property using Combine,
    /// and assigns the latest value to the local `dataArray` whenever it changes.
    ///
    /// - Note: The subscription is stored in `cancellables` to maintain its lifecycle.
    func addSubscribers() {
        dataService.$productModels
            .sink { [weak self] (productModels) in
                self?.dataArray = productModels
            }
            .store(in: &cancellables)
    }
}
