//
//  Toolbar63Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 12/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing FocusState.
struct Toolbar63Bootcamp: View {
    
    // MARK: PROPERTIES
    @State private var text: String = ""
    @State private var paths: [String] = []
    
    var body: some View {
        NavigationStack (path: $paths) {
            ZStack {
                Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
                    .ignoresSafeArea(edges: .all)
                
                ScrollView {
                    TextField("Placeholder...", text: $text)
                        .padding()
                    
                    ForEach (0..<50) { _ in
                        Rectangle()
                            .fill(.indigo)
                            .frame(width: 200, height: 200)
                    }
                }
            }
            
            .navigationTitle("Toolbar")
            /*.navigationBarItems(                         // DEPRECATED
                leading: Image(systemName: "heart.fill"),
                trailing: Image(systemName: "gear")
            )*/
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Image(systemName: "heart.fill")
                })
                ToolbarItem(placement: .automatic) {
//                    HStack {
//                        Image(systemName: "house.fill")
                        Image(systemName: "gear")
//                    }
                }
                ToolbarItem(placement: .keyboard) { // build app to see the toolbar item on keyboard.
                    Image(systemName: "key")
                }
                
            }
//            .toolbar(.hidden, for: .navigationBar)
//            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                Button("Screen one") {
                    paths.append("Screen one")
                }
                Button("Screen two") {
                    paths.append("Screen two")
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("Destination for \(value)")
            }
            
        }
    }
}


// MARK: PREVIEW
#Preview {
    Toolbar63Bootcamp()
}
