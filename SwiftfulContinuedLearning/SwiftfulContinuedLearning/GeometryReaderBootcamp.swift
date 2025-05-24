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
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(#colorLiteral(red: 1, green: 0.5144756436, blue: 0, alpha: 1)))
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        })
    }
}

// MARK: FUNCTIONS
extension GeometryReaderBootcamp {
    
    /// Gets the Angle percentage calculation
    ///
    /// This method calculates the right position to create the 3DEffect.
    ///
    /// ```
    ///     getPercentage(geo: GeometryProxy) -> Double
    /// ```
    /// - Parameters:
    ///   - geo: GeometryProxy parameter.
    /// - Returns:
    ///   - Double value contain the angle.
    /// - Complexity
    ///     - *O(1)* constant.
    ///
    private func getPercentage(geo: GeometryProxy) -> Double {
        let distance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / distance))
    }
}

// MARK: PREVIEW
#Preview {
    GeometryReaderBootcamp()
}
