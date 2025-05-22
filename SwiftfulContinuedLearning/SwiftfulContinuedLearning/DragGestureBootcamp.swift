//
//  DragGestureBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 21/05/25.
//

import SwiftUI

struct DragGestureBootcamp: View {
    // MARK: PROPERTIES
    @State private var offset: CGSize = .zero
    // MARK: BODY
    var body: some View {
        simpleDragView
    }
}

// MARK: EXTENSIONS
extension DragGestureBootcamp {
    /// A simple rectangle view to basics sample gesture
    private var simpleDragView: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()){
                                offset = .zero
                            }
                        }
                )
        }
    }
}
/// methods extension
extension DragGestureBootcamp {
    /// Gets scale amount based on offset.
    ///
    /// This method returns a CGFloat as result:
    ///
    /// ```
    /// getScaleAmount() -> CGFloat
    /// ```
    ///
    /// - Returns
    ///     - CGFloat value scaleEffect
    private func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let current = abs(offset.width)
        let percentage = current / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
}
// MARK: PREVIEW
#Preview {
    DragGestureBootcamp()
}
