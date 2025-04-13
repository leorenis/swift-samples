//
//  ResizebleSheet64Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 13/04/25.
//

import SwiftUI

/// A data struct to provide struct to practicing ResizebleSheet.
struct ResizebleSheet64Bootcamp: View {
    
    // MARK: PROPERTIES
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        ZStack {
            // background
            Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
                .ignoresSafeArea(edges: .all)
            
            // foreground
            VStack {
                Button("Show Sheet") {
                    showSheet.toggle()
                }
                .sheet(isPresented: $showSheet) {
                    MyNextSheetView(detents: $detents)
//                        .presentationDetents([.fraction(0.2), .height(200),.medium, .large], selection: $detents)
//                        .presentationDragIndicator(.automatic)
//                        .interactiveDismissDisabled(true)
                }
            }
        }
    }
}


/// A data struct to provide struct to practicing MyNextSheet.
struct MyNextSheetView: View {
    // MARK: PROPERTIES
    @Binding var detents: PresentationDetent
    
    var body: some View {
        ZStack {
            // background
            Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
                .ignoresSafeArea(edges: .all)
            
            // foreground
            VStack (spacing: 20) {
                Button("Medium") {
                    detents = .medium
                }
                Button("Large") {
                    detents = .large
                }
                Button("Height") {
                    detents = .height(200)
//                    detents = .height(201) // THIS WOULDN'T WORKS, BECAUSE detents MUST be IN presentationDetens Set.
                }
            }
        }
        .presentationDetents([.fraction(0.2), .height(200),.medium, .large], selection: $detents)
        .presentationDragIndicator(.automatic)
        .interactiveDismissDisabled(true)
    }
}

// MARK: PREVIEW
#Preview {
    ResizebleSheet64Bootcamp()
}
