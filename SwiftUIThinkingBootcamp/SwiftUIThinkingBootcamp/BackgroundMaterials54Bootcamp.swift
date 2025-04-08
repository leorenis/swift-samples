//
//  BackgroundMaterials54Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 08/04/25.
//

import SwiftUI

struct BackgroundMaterials54Bootcamp: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 300)
            .frame(maxWidth:.infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .background(
            Image("bgcity")
        )
        .ignoresSafeArea()
    }
}
// MARK: PREVIEW
#Preview {
    BackgroundMaterials54Bootcamp()
}
