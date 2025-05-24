//
//  GeometryReaderBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 24/05/25.
//

import SwiftUI

/// Geometry Reader struct. Try not to use, but when really neet, go ahead and use it. Nick's comment.
/// GeometryReader is expense, it runs tasks to calculate geometry screen. Use only when you are certanly that you need. If you not sure, use UIScreen.main.bounds.width
struct GeometryReaderBootcamp: View {
    //MARK: PROPERTIES
    
    //MARK: BODY
    var body: some View {
        HStack(spacing: 0) {
            Rectangle().fill(Color.red)
            Rectangle().fill(Color.blue)
        }
        .ignoresSafeArea()
    }
}

// MARK: PREVIEW
#Preview {
    GeometryReaderBootcamp()
}
