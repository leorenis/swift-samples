//
//  NavigationViewBootcamp.swift
//  SwiftUIThinkingBootcamp
//
//  Created by Leo on 31/03/25.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        
        // Deprecated:
        // Use NavigationStack and NavigationSplitView instead. For more information, see Migrating to new navigation types.
        NavigationView {
            ScrollView {
                NavigationLink("Menu 1", destination: DestinationView())
            }
        }
        .navigationTitle("All inboxes")
        //.navigationBarTitleDisplayMode(.inline)
        //.navigationBarHidden(true)
        .navigationBarItems(
                leading:
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    },
                trailing: NavigationLink(
                    destination: DestinationView(),
                    label: {
                        Image(systemName: "gear")
                    }
                )
        )
        
    }
}

struct DestinationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea(edges: .all)
                .navigationTitle(Text("Green screen!"))
                .navigationBarHidden(true)
            
            VStack {
                Button("< Back button") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                NavigationLink("Next >", destination: Text("3rd screen"))
            }
        }
    }
}
#Preview {
    NavigationViewBootcamp()
}
