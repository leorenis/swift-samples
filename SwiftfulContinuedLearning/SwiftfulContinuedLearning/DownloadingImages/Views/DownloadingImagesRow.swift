//
//  DownloadingImagesRow.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 09/07/25.
//

import SwiftUI

struct DownloadingImagesRow: View {
    // MARK: PROPERTIES
    let model: ProductModel
    var body: some View {
        HStack {
            Circle()
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.thumbnail)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .italic(true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview(traits: .sizeThatFitsLayout, body: {
    let model = ProductModel(id: 1, title: "Mackbook Pro 14", price: 5000.0, thumbnail: "https://via.placeholder.com/150")
    DownloadingImagesRow(model: model)
        .padding()
})
