//
//  DownloadingImageView.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 09/07/25.
//

import SwiftUI

struct DownloadingImageView: View {
    // MARK: PROPERTIES
    @State var isLoading: Bool = true
    
    var body: some View {
        if isLoading {
            ProgressView()
        } else {
            Circle()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout, body: {
    DownloadingImageView()
        .frame(width: 75, height: 75)
})
