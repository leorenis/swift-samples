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
                .rotationEffect(Angle(degrees: getRotationAmount()))
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
                .foregroundStyle(Color.indigo)
        }
    }
}
/// Methods extension
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
    
    /// Gets rotation amount based on offset.
    ///
    /// This method returns a Double as result:
    ///
    /// ```
    /// getRotationAmount() -> CGFloat
    /// ```
    ///
    /// - Returns
    ///     - CGFloat value scaleEffect
    private func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentAsDouble * maxAngle
    }
}
// MARK: PREVIEW
#Preview {
    DragGestureBootcamp()
}
