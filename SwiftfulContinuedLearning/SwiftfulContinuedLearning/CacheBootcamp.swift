//
//  CacheBootcamp.swift
//  SwiftfulContinuedLearning
//
//  Created by Leo on 02/07/25.
//

import SwiftUI

// MARK: VIEW MODEL
fileprivate class CacheViewModel: ObservableObject {
    @Published var startingImage: UIImage? = nil
    let imageName: String = "dog"
    
    init() {
        getImageFromAssets()
    }
    
    func getImageFromAssets() {
        startingImage = UIImage(named: imageName)
    }
}

// MARK: VIEW
struct CacheBootcamp: View {
    // MARK: PROPERTIES
    @ObservedObject fileprivate var vm = CacheViewModel()
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            VStack {
                if let image = vm.startingImage {
                    Image(uiImage: image)
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
