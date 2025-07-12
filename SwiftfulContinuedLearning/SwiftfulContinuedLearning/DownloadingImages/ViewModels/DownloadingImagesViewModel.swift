//
//  DownloadingImagesViewModel.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 08/07/25.
//

import Foundation
import Combine

/// A view model responsible for managing and observing a list of product models with image data.
///
/// `DownloadingImagesViewModel` observes changes in the `ProductModelDataService` to maintain an up-to-date list
/// of `ProductModel` items. It leverages the Combine framework to subscribe to the data stream and automatically
/// publishes updates to the UI via the `@Published` `dataArray` property.
///
/// This view model is suitable for use in SwiftUI views that need to display dynamic lists of products
/// with images downloaded from the internet.
class DownloadingImagesViewModel: ObservableObject {
    
    /// The array of downloaded `ProductModel` items, published to allow SwiftUI views to update reactively.
    @Published var dataArray: [ProductModel] = []
    
    /// A singleton dataService responsible for downloading product data from the internet.
    let dataService = ProductModelDataService.instance
    
    /// A set to store Combine subscriptions to keep them alive.
    var cancellables: Set<AnyCancellable> = []
    
    /// Initializes the view model and sets up subscriptions to data updates.
    ///
    /// Upon initialization, the view model begins observing `productModels` from the `dataService`.
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
