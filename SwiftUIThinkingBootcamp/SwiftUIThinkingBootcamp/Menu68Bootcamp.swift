//
//  Menu68Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 14/04/25.
//

import SwiftUI
/// A data struct to provide struct to practicing Menu.
struct Menu68Bootcamp: View {
    var body: some View {
        
        Menu("Actions") {
            Button("Duplicate", action: {})
            Button("Rename", action: {})
            Button("Delete…", action: {})
            Menu("Copy") {
                Button("Copy", action: {})
                Button("Copy Formatted", action: {})
                Button("Copy Library Path", action: {})
            }
        }
        
        Menu {
            Button("Open in Preview", action: {})
            Button("Save as PDF", action: {})
        } label: {
            Label("PDF", systemImage: "doc.fill")
        }
        
        
        Menu("Click me") {
            Button("First Item") {}
            Button("Second Item") {}
            Button("Third Item") {}
        }
        
        
        Menu {
            Text("First Item")
            Text("Second Item")
            Text("Third Item")
        } label: {
            Text("Text menu")
        }
    }
}

// MARK: PREVIEW
#Preview {
    Menu68Bootcamp()
}
