//
//  Badges59Bootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 09/04/25.
//

import SwiftUI

/// A data struct to provide a Badges.
///
/// Badges appear only in list rows, tab bars, and menus.
/// - List
/// - Tab var
struct Badges59Bootcamp: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .badge(1)
        TabView {
            Tab("Home", systemImage: "house") {
                VStack {
                    Text("Use a badge to convey optional, supplementary information about a view. The number provided will appear as a numerical indicator on the given tab. The following example shows a TabView with the value of alerts.count displayed as a badge on the alerts tab.")
                        .textSelection(.enabled)
                        .padding(20)
                        .background(.ultraThinMaterial)
                }
                .padding()
            }
            Tab("Services", systemImage: "gear") {
                ZStack {
                    List {
                        Text("Programming")
                            .badge(5)
                        Text("Cloud computin")
                            .badge("New")
                        Text("UX Desing")
                        Text("Data Science")
                    }
                }
            }
            .badge("New")
            Tab("Messages", systemImage: "message") {
                Text("Message")
            }.badge(2)
        }
    }
}

// MARK: PROPERTIES
#Preview {
    Badges59Bootcamp()
}
