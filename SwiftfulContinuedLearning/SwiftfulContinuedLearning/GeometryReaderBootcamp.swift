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
        withGeoReaderScrollView
        .ignoresSafeArea()
    }
}

// MARK: EXTENSIONS
extension GeometryReaderBootcamp {
    /// Simulate problem when landscape mode.
    private var noGeometryCalcView: some View {
        HStack(spacing: 0) {
            Rectangle().fill(Color.red)
                .frame(width: UIScreen.main.bounds.width * 0.6)
            Rectangle().fill(Color.blue)
        }
    }
    
    /// Simulate solution using geometry reader to infer width.
    private var withGeometryCalcView: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle().fill(Color.red)
                    .frame(width: geometry.size.width * 0.6)
                Rectangle().fill(Color.blue)
            }
        }
    }
    
    /// Scroll view to simulate effect using geometry reader, rotation3DEffect and horizontal scroll.
    private var withGeoReaderScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.teal)
                    .rotation3DEffect(
                        Angle(degrees: 45),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .frame(width: 300, height: 300)
                    .padding()
            }
        })
    }
}

// MARK: PREVIEW
#Preview {
    GeometryReaderBootcamp()
}
