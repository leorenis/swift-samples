//
//  BackgroundAndOverlayBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 27/03/25.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(Color.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(colors: [Color(#colorLiteral(red: 0.5656216145, green: 0.3601833582, blue: 0.9900026917, alpha: 1)), Color(#colorLiteral(red: 0.4787859917, green: 0.3048661649, blue: 0.8379783034, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), radius: 10, x: 0.0, y: 10)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), radius: 10, x: 5, y: 5)
                        , alignment: .bottomTrailing)
            )
    }
}

#Preview {
    BackgroundAndOverlayBootcamp()
}
