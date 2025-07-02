//
//  CacheBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 02/07/25.
//

import SwiftUI

// MARK: VIEW
struct CacheBootcamp: View {
    // MARK: BODY
    var body: some View {
        NavigationStack {
            VStack {
                Image("dog")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 288, height: 330)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("Save to Cache")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Delete from Cache")
                            .font(.headline)
                            .padding()
                            .background(Color.red)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    }
                }

                Spacer()
            }
            .navigationTitle("Cache bootcamp")
            
        }
    }
}
// MARK: PREVIEW
#Preview {
    CacheBootcamp()
}
