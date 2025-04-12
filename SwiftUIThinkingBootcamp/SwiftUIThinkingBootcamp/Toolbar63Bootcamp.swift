//
//  Toolbar63Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 12/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing FocusState.
struct Toolbar63Bootcamp: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo
                    .ignoresSafeArea(edges: .all)
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
                
            }
        }
    }
}


// MARK: PREVIEW
#Preview {
    Toolbar63Bootcamp()
}
