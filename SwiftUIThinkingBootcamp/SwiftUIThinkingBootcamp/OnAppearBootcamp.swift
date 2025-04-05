//
//  OnAppearBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 04/04/25.
//

import SwiftUI

struct OnAppearBootcamp: View {
    
    // MARK: PROPERTIES
    @State var message: String = "Loading..."
    @State var count: Int = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(message)
                    .font(.headline)
                
                LazyVStack {
                    ForEach(0..<50, id: \.self) { _ in
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 200)
                            .padding()
                            .onAppear(perform: {
                                count += 1
                            })
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    message = "This is the new text"
                }
            })
            .onDisappear(perform: {
                message = "Ending..."
            })
            .navigationBarTitle("OnAppear: \(count)")
        }
    }
}

// MARK: PREVIEW
#Preview {
    OnAppearBootcamp()
}
