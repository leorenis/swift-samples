//
//  HomeView.swift
//  SwiftfulSourceControl
//
//  Created by Leo on 29/04/25.
//

import SwiftUI

struct HomeView: View {
    @State private var animation: Bool = false
    var body: some View {
        VStack {
            Image(systemName: "arrow.up.circle")
                .font(.largeTitle)
                .fontWeight(.light)
                .foregroundStyle(animation ? Color.indigo : Color.blue)
                .padding(.vertical, animation ? 0 : -30)
        }
        .onAppear {
            guard !animation else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 1).repeatForever()) {
                    animation.toggle()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
